package kr.or.auction.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
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
	private AuctionService service;
	
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
						
			ArrayList<Integer> notifyMemberList = service.insertBid(b);
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
						// 본인일땐 굳이 안보내도 될거같아서 뺐음
						if(s!=null&&s!=session) {
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


	public void sendBidSuccessMsg(int memberNo) throws Exception {
		// 해당 회원번호가 memberList에 있는지 확인
		WebSocketSession s = memberList.get(memberNo);
		
		// value가 있는지 확인
		if(s!=null) {
			TextMessage tm = new TextMessage("bidSuccess");
			s.sendMessage(tm);
		}
	}

}
