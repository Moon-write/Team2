package kr.or.auction.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.or.auction.model.dao.AuctionDao;
import kr.or.auction.model.vo.Auction;
import kr.or.auction.model.vo.Bid;
import kr.or.common.model.vo.Order;
import kr.or.common.model.vo.OrderProduct;

public class BidHandler extends TextWebSocketHandler {
	// 접속한 회원 목록 저장용 리스트 (로그인 안해도 무조건 저장)
	private ArrayList<WebSocketSession> sessionList;
	// 로그인 회원 전용 해시맵 (세션마다 no 저장)
	private HashMap<Integer, WebSocketSession> memberList;
	
	@Autowired
	private AuctionDao dao;
	
		
	public BidHandler() {
		super();
		sessionList = new ArrayList<WebSocketSession>();
		memberList = new HashMap<Integer, WebSocketSession>();
		
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 웹소켓 접속시 접속회원 리스트에 추가
		sessionList.add(session);
	}
	
	// 로그인, 입찰
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		// 메세지 받기
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(message.getPayload());
		
		// 메세지 타입 분석
		String type = element.getAsJsonObject().get("type").getAsString();
		
		if(type.equals("login")) {
			// 로그인할 경우 해시맵에 연동
			int memberNo = element.getAsJsonObject().get("memberNo").getAsInt();
			memberList.put(memberNo, session);
		}else if(type.equals("bid")) {
			// 입찰할 경우 데이터 꺼내서 dao에 연결
			Bid b = new Bid();
			
			b.setProjectNo(element.getAsJsonObject().get("projectNo").getAsInt());
			b.setMemberNo(element.getAsJsonObject().get("memberNo").getAsInt());
			b.setBidAmount(element.getAsJsonObject().get("bidAmount").getAsInt());
			b.setBidPrice(element.getAsJsonObject().get("bidPrice").getAsInt());
			b.setBidMsg(element.getAsJsonObject().get("bidMsg").getAsString());
			
			ArrayList<Integer> notifyMemberList = insertBid(b);
			if(notifyMemberList==null) {
				// 입찰불가 - 본인에게만 메세지전송
				TextMessage tm = new TextMessage("error");
				session.sendMessage(tm);
			}else {
				// 입찰 성공 - 본인에게 메세지 전송
				TextMessage tm = new TextMessage("success");
				session.sendMessage(tm);
				
				if(notifyMemberList.size()>0) {
				// 알림받을 사람이 있을때 - 떨어진 사람들에게 메세지 전송
					for(int i : notifyMemberList) {
						// 리스트의 모든 회원번호에 대해 세션이 정보를 가지고 있는지 조회
						WebSocketSession s = memberList.get(i);
						
						// 정보가 있을때 (세션이 로그인중일때)
						if(s!=null) {
							String msg = "drop/"+b.getProjectNo();
							TextMessage tmOther = new TextMessage(msg); // 탈락이라는 메세지 작성
							
							s.sendMessage(tmOther);
						}
					}					
				}	
				// 그외 접속중인 모든 사람들에게 입찰내역 변동 메세지를 보냄
				for(WebSocketSession enterSession : sessionList) {
					TextMessage tmNo = new TextMessage("update/"+String.valueOf(b.getProjectNo())); // projectNo 전송
					enterSession.sendMessage(tmNo);
				}
			}			
		}		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		// 접속 종료시 종료된 세션을 list에서 제거
		sessionList.remove(session);
	}
	
	public ArrayList<Integer> insertBid(Bid b) {
		// 시간이 남았는지 체크하기
		int result = dao.checkEndTime(b.getProjectNo());
		
		// 시간이 남았을때만(양수일때만 입찰가능)
		if(result>0) {
			result = dao.insertBid(b);
			if(result>0) {
				// 입찰 성공시 주문내역 생성
				result = insertOrder(b);
				
			}else {
				// 입찰 실패시 return
				
			}
			
		}else {
			return null;
		}
		// 순위변동 업데이트
		Auction a = dao.selectAuction(b.getProjectNo());
		ArrayList<Bid> bidList = dao.getBidList(b.getProjectNo());
		
		int auctionAmount = a.getAuctionAmount();
		int successAmount = 0;
		ArrayList<Integer> notifyMemberList = new ArrayList<Integer>();
		
		for(int i=0;i<bidList.size();i++) {
			// 내 입찰의 입찰량
			int myBidAmount = bidList.get(i).getBidAmount();
			successAmount += myBidAmount;
			
			// 원래 안정권이었던 요소
			if(bidList.get(i).getBidSuccess()==1||bidList.get(i).getBidSuccess()==2) {				
				if(auctionAmount>=successAmount) {
					// 그대로 안정권이라면 pass
					
					
				}else if(auctionAmount<successAmount&&auctionAmount>(successAmount-myBidAmount)) {
					// 내 입찰량 뺀거보단 크고 내 입찰량 더한거보단 작을때 - 부분낙찰
					result = updateBidRank(bidList.get(i), 2);
					if(result>0) {
						notifyMemberList.add(bidList.get(i).getMemberNo());
					}
									
				}else{
					// 완전낙찰일때
					result = updateBidRank(bidList.get(i), 0);
					if(result>0) {
						notifyMemberList.add(bidList.get(i).getMemberNo());
					}
				}
			}
		} // for문 종료
		// 알림보내는 웹소켓으로 리스트 전달
		return notifyMemberList;
	}
	
	private int insertOrder(Bid b) {
		Auction a = dao.selectAuction(b.getProjectNo());
		
		Order o = new Order();
		o.setDivNo(4);
		o.setMemberNo(b.getMemberNo());
		o.setOrderPrice(b.getBidPrice()*b.getBidAmount());
		o.setProjectNo(b.getProjectNo());
		o.setSellerNo(a.getMemberNo());
		
		int result = dao.insertOrder(o);
		
		if(result>0) {
			OrderProduct op = new OrderProduct();
			op.setOrderNo(o.getOrderNo());
			op.setProductAmount(b.getBidAmount());
			op.setProductPrice(b.getBidPrice());
			op.setOptionNo(b.getBidNo());
			
			result = dao.insertOrderProduct(op);
			
			if(result<0) return -3;
		}else {
			return -3;
		}		
		return result;
	}

	public int updateBidRank(Bid bid, int successRange){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bidNo",bid.getBidNo());
		map.put("successRange", successRange);
		int result = dao.updateBidRank(map);
		
		return result;
	}

}
