package kr.or.auction.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.auction.model.dao.AuctionDao;
import kr.or.auction.model.vo.Auction;
import kr.or.auction.model.vo.AuctionList;
import kr.or.auction.model.vo.Bid;
import kr.or.common.model.vo.Comment;
import kr.or.common.model.vo.Order;
import kr.or.common.model.vo.OrderProduct;

@Service
public class AuctionService {

	@Autowired
	private AuctionDao dao;
	@Autowired
	private BidHandler bidHandler;

	public int insertAuction(Auction auction) {
		return dao.insertAuction(auction);
	}

	public Auction selectAuction(int projectNo, int memberNo) {
		// 조회수체크
		dao.checkViewCount(projectNo);
				
		Auction a = dao.selectAuction(projectNo);
		a = getMoreInfo(a, memberNo);

		return a;
	}
	
	public AuctionList selectAuctionList(int memberNo, int reqPage, int startFlag, int endFlag, int order, String searchKeyword) {
		AuctionList auctionList = new AuctionList();	
		
		
		// 페이지설정
		// 한페이지당 컨텐츠수
		int rowOflist = 5;
		// 시작컨텐츠번호
		int startNum = rowOflist * (reqPage-1) +1;
		// 끝컨텐츠번호
		int endNum = rowOflist * reqPage ;
	
		
		// 링크이동구문
		String link = "/auctionList.kh?startFlag="+startFlag+"&endFlag="+endFlag+"&order="+order+"&searchKeyword="+searchKeyword+"&reqPage=";
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("order", order);
		map.put("keyword", searchKeyword);
		map.put("startFlag", startFlag);
		map.put("endFlag", endFlag);
		
		ArrayList<Auction> list = new ArrayList<Auction>();
		if(order==3||order==4) { // 관심순, 조회수순
			list = dao.selectAuctionListbyLike(map);
		}else { // 이외 (마감임박순, 최근등록순)
			list = dao.selectAuctionList(map);			
		}			
		
		// 페이지 시작번호
		int pageStart = ((reqPage-1)/rowOflist)*rowOflist+1;
		// 총 컨텐츠 수
		int contentCount = dao.checkPageCount(map);	
		// 페이지 끝번호
		int pageEnd;
		
		if(contentCount % rowOflist==0) {
			pageEnd = contentCount / rowOflist;
		}else {
			pageEnd = contentCount / rowOflist +1 ;
		}
		if(contentCount>endNum) {
			map.put("endNum", contentCount);
		}
	
		String pagination = "<ul class='pagination circle-style'>";
		
		if(pageStart!=1) { // 이전으로 넘어갈 페이지가 있다면
			pagination += "<li><a class='page-item' href='"+link+(int)(pageStart-1)+"'><span class='material-symbols-outlined'>keyboard_double_arrow_left</span></a></li>";
		}
		if(reqPage!=pageStart) { // 시작페이지와 현재페이지가 같지않다면 =이전페이지가 있다면
			pagination += "<li><a class='page-item' href='"+link+(int)(reqPage-1)+"'><span class='material-symbols-outlined'>chevron_left</span></a></li>";
		}
		for(int i = pageStart ;i<= ((pageEnd<pageStart+4)? pageEnd : 5);i++) {
			if(reqPage == (int)(i)) {
				pagination += "<li><a class='page-item active-page' href='"+link+(reqPage)+"'>"+(int)reqPage+"</a></li>";
			}else {
				pagination += "<li><a class='page-item' href='"+link+(int)(i)+"'>"+(int)(i)+"</a></li>";				
			}
		}
		if(reqPage!=pageEnd) {
			pagination += "<li><a class='page-item' href='"+link+(int)(reqPage+1)+"'><span class='material-symbols-outlined'>chevron_right</span></a></li>";
		}
		if(pageEnd>=pageStart+rowOflist) {
			pagination += "<li><a class='page-item' href='"+link+(int)(pageStart+rowOflist)+"'><span class='material-symbols-outlined'>keyboard_double_arrow_right</span></a></li>";
		}
		pagination += "</ul>";
		
		//memberNo가 0이면 그냥지나감
		for(Auction a : list) {			
			a = getMoreInfo(a, memberNo);
			
		}
		auctionList.setAuctionList(list);		
		auctionList.setPagination(pagination);		
		
		return auctionList;
	}

	public int addLike(int memberNo, int projectNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		int result = dao.addLike(map);
		
		if(result>0) {
			result = dao.getTotalLike(projectNo);
		}else {
			return -1;
		}
		return result;
	}

	public int removeLike(int memberNo, int projectNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("projectNo", projectNo);
		int result = dao.removeLike(map);
		
		if(result>0) {
			result = dao.getTotalLike(projectNo);
		}else {
			return -1;
		}
		return result;
	}

	public ArrayList<Auction> selectLikeList(int memberNo, int pageNo) {
		// 한 페이지당 들어갈 콘텐츠 수
		int rowOfList = 3;
		// 시작숫자
		int startNum = rowOfList*(pageNo-1)+1;
		int endNum = rowOfList*pageNo;
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		// 프로젝트 숫자 불러오기
		List<Integer> projectlist = dao.selectLikeList(map);
		
		if(projectlist.isEmpty()) {
			return null;
		}else {
			ArrayList<Auction> list = dao.getLikeAuction(projectlist);
			
			for(Auction a : list) {
				// 1. 입찰횟수 구하기
				int bidCount = dao.getBidCount(a.getProjectNo());
				a.setBidCount(bidCount);
				
				// 2. 현재 낙찰가능금액 구하기
				int bestPrice;
				if(bidCount==0) {
					bestPrice = a.getAuctionPrice();
				}else {
					bestPrice = dao.getMinBidPrice(a.getProjectNo());			
				}
				a.setBestPrice(bestPrice);
			}
			
			return list;			
		}
	}

	public int checkMyLikeCount(int memberNo) {
		// TODO Auto-generated method stub
		return dao.checkMyLikeCount(memberNo);
	}

	public ArrayList<Bid> getBidList(int projectNo) {
		ArrayList<Bid> list = dao.getBidList(projectNo);
		return list;
	}

	public ArrayList<Bid> getBidHistory(int projectNo) {
		ArrayList<Bid> list = dao.getBidHistory(projectNo);
		return list;
	}

	@Transactional
	public int updateAuction() {
		// 1 새로 마감되는 경매건 조사
		// 아직 안 닫힌 프로젝트 중 + 날짜가 지난 건을 찾아 > 프로젝트no와 판매 수량을 불러온다
		ArrayList<Auction> list = dao.selectEndAuction();

		// 불러온 프로젝트가 있을 경우에만 (=대상이 있을 경우에만) 다음 로직 수행
		if(list!=null&&list.size()!=0) {
			
			// 해당 프로젝트 각각에 대한 처리과정
			for(Auction a : list) {
				
				// 2 해당 경매건 마감처리
				// 위에서 불러온 projectNo의 close여부를 수정한다.
				int result = dao.updateAuctionStatus(a);
				if(result<=0) return -1; // close여부 수정 안됐을경우 -1 리턴
				
				// 3 낙찰자 리스트업
				// 해당 projectNo 기준으로 낙찰권(1/2)에 있는 row를 가져온다. 단 order by asc로 1번이 먼저 들어오게 설정
				// 가져오는 정보 : bidNo, memberNo(참여자정보), bidAmount, bidPrice, bidSuccess
				ArrayList<Bid> bidList = dao.getSuccessBidList(a);
				
				// 혹시 낙찰자가 없으면 = 입찰자 자체가 없으면 패스
				if(bidList==null&bidList.size()==0) return 1; // 입찰자 차제가 없는건 문제가 크게 안되니 1
				
				int sum = 0;
				// 4 낙찰자 상태 변경
				for(Bid b : bidList) {
					// 각 낙찰건에 대한 order번호를 찾아서 주문상태를 바꾸는 것이 목표
					
					if(b.getBidSuccess()==1) {
						// 전체낙찰인경우
						// 각 입찰건에 대해 옵션No 연동된 내역 상태 변경
						result = dao.updateOrderStatus(b);
						if(result<=0) return -1;
						sum += b.getBidAmount();
						
					}else if(b.getBidSuccess()==2) {
						// 부분낙찰인경우
						b.setBidAmount(a.getAuctionAmount()-sum); // 잔여수량으로 bid 수량변경

						result = dao.updateOrderStatus(b); // 주문내역만 변경 - 주문상태와 총금액
						if(result<=0) return -2;

						// 수량변경은 ORDER_PRODUCT에서 변경
						result = dao.updateOrderAmount(b);
						if(result<=0) return -3;
					}
					// 4 낙찰자에게 메세지 보낼 수 있으면 메세지까지 보내기
					try {
						bidHandler.sendBidSuccessMsg(a.getMemberNo());
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			} // 각 프로젝트별 낙찰건 적용 완료ㅕ
		}		
		return 0;
	}

	public Order selectOneOrder(int orderNo) {
		Order order = dao.selectOneOrder(orderNo);
		ArrayList<OrderProduct> op = dao.selectOrderProduct(orderNo);
		order.setOrderProductList(op);
		return order;
	}

	public int getBidCount(int projectNo) {
		int result = dao.getBidCount(projectNo);
		return result;
	}

	public Auction getMoreInfo(Auction a, int memberNo) {
	
		// 1. 입찰횟수 구하기
		int bidCount = dao.getBidCount(a.getProjectNo());
		a.setBidCount(bidCount);
		
		// 2. 현재 낙찰가능금액 구하기
		int bestPrice;
		if(bidCount==0) {
			bestPrice = a.getAuctionPrice();
		}else {
			bestPrice = dao.getMinBidPrice(a.getProjectNo());			
		}
		// 3. 내 좋아요 여부 구하기
		if(memberNo!=0) {
			HashMap<String, Object> map2 = new HashMap<String, Object>();
			map2.put("projectNo", a.getProjectNo());
			map2.put("memberNo", memberNo);
			
			int	result = dao.getLike(map2);
			
			if(result==1) {
				// 좋아요가 있으면
				a.setLike(1);
			}else {
				a.setLike(0);
			}
		}			
	
		a.setBestPrice(bestPrice);
		a.setTotallike(dao.getTotalLike(a.getProjectNo()));	
	
		return a;
	}

	public int updateOrderPay(Order o) {
		int result = dao.updateOrderPay(o);
		return result;
	}
	
	@Transactional
	public ArrayList<Integer> insertBid(Bid b) {
		// 시간이 남았는지 체크하기
		float result = dao.checkEndTime(b.getProjectNo());
		
		if(result<=0.0) return null;
		
		// 시간이 남았을때만(양수일때만 입찰가능)
		
		// 주문내역을 먼저 만들고 selectkey로 orderNo 받아오기
		b = insertOrder(b);
		if(b==null) return null; // 주문내역이 안만들어지면 return null;
		
		// 정상적으로 입찰 완료된다음 하는일 : 순위변동 업데이트
		
		// (1) projectNo로 경매 불러오기
		Auction a = dao.selectAuction(b.getProjectNo());
		
		// (2) 해당 경매 관련한 bidList 불러오기 (원래 0번인애들은 필요없고 1아니면 2였던 애들만) - 정렬기준 제일 높은 금액 역순+먼저 등록한순
		// 가져오는 요소 : bidNo, memberNo, bidAmount, bidPrice, bidSuccess
		ArrayList<Bid> bidList = dao.getSuccessBidList(a);
		
		
		// (3) 경매낙찰수량과 현재 진행수량, 알림줘야 할 회원번호 리스트 변수 셋팅
		int auctionAmount = a.getAuctionAmount();
		int successAmount = 0;
		ArrayList<Integer> notifyMemberList = new ArrayList<Integer>();
		
		// (4) 경매 사이즈만큼 반복
		for(Bid bid : bidList) {
			// 내 입찰의 입찰량 성공에 반영
			int myBidAmount = bid.getBidAmount();
			
			if(bid.getBidSuccess()==1) {
				// 원래 당연확정이었을때
				if(auctionAmount>=successAmount+myBidAmount) {
					// 내걸 더해도 안정권이면 pass
					successAmount += myBidAmount;
				}else if(auctionAmount<successAmount+myBidAmount&&auctionAmount>successAmount){
					// 내 입찰량 뺀거보단 크고 내 입찰량 더한거보단 작을때 - 부분낙찰
					result = updateBidRank(bid, 2);
					if(result>0) notifyMemberList.add(bid.getMemberNo()); // 정상적으로 update되면 알림리스트에 추가
					successAmount += myBidAmount;
				}else{
					// 완전낙찰일때
					
					result = updateBidRank(bid, 0);
					if(result>0) notifyMemberList.add(bid.getMemberNo());
				}			
				
			}else {
				// 원래 부분낙찰이었을때
				if(auctionAmount<successAmount+myBidAmount&&auctionAmount>successAmount){
					// 내 입찰량 뺀거보단 크고 내 입찰량 더한거보단 작을때 - 부분낙찰
					result = updateBidRank(bid, 2);
					successAmount += myBidAmount;
				}else{
					// 완전낙찰일때
					result = updateBidRank(bid, 0);
					if(result>0) notifyMemberList.add(bid.getMemberNo());
				}			
			}
		} // for문 종료
		// 알림보내는 웹소켓으로 리스트 전달
		return notifyMemberList;
	}	
	
	public Bid insertOrder(Bid b) {
		
		Auction a = dao.selectAuction(b.getProjectNo());
		
		Order o = new Order();
		o.setDivNo(4);
		o.setMemberNo(b.getMemberNo());
		o.setOrderPrice(b.getBidPrice()*b.getBidAmount());
		o.setProjectNo(b.getProjectNo());
		o.setSellerNo(a.getMemberNo());
		
		int result = dao.insertOrder(o);
		if(result<=0) return null;		
						
		// 불러온 orderNo를 b 객체에 집어넣기
		b.setOrderNo(o.getOrderNo());	
		
		// 해당 orderNo를 함께 insert 
		result = dao.insertBid(b);
		if(result<=0) return null; // 입찰이 성공안하면 return null;
		
		OrderProduct op = new OrderProduct();
		op.setOrderNo(o.getOrderNo());
		op.setProductAmount(b.getBidAmount());
		op.setProductPrice(b.getBidPrice());
		op.setOptionNo(b.getBidNo());
		
		result = dao.insertOrderProduct(op);
		
		if(result<0) return null; // 관련상품 만드는데 문제생기면 return null
		
		return b; // 최종 리턴은 매개변수로 들어온 bid 객체+주문번호 추가
	}

	
	public int updateBidRank(Bid bid, int successRange){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bidNo",bid.getBidNo());
		map.put("successRange", successRange);
		int result = dao.updateBidRank(map);
		
		return result;
	}

	public Auction pickOneAuction(int projectNo) {
		Auction a = dao.selectAuction(projectNo);
		return a;
	}


	public int modifyAuction(Auction a) {
		int result2= dao.updateAuctionInfo(a);
		return result2;
	}

	public Auction checkUpdatable(int projectNo) {
		Auction a = null;
		
		float result = dao.checkUpdatable(projectNo);
		if(result>0) {
			a = dao.selectAuction(projectNo);
		}
		return a;
	}

	public int modifyAuctionContent(Auction a) {
		int  result  =dao.updateAuctionContent(a);
		return result;
	}

	public ArrayList<Comment> selectCommentList(int projectNo, int pageNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 페이지설정
		// 한페이지당 컨텐츠수
		int rowOflist = 5;
		// 시작컨텐츠번호
		int startNum = rowOflist * (pageNo-1) +1;
		// 끝컨텐츠번호
		int endNum = rowOflist * pageNo ;
		
		map.put("projectNo", projectNo);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		ArrayList<Comment> list = dao.selectAuctionComment(map);
		return list;
	}

	public Comment addComment(Comment c) {
		int result = dao.addComment(c);
		if(result>0) {
			Comment comment = dao.selectLastComment(c);
			return comment;
		}else {
			return null;
		}
	}

	public Comment selectOneComment(Comment c) {
		// TODO Auto-generated method stub
		return dao.selectOneComment(c);
	}

	public int modifyComment(Comment c) {
		// TODO Auto-generated method stub
		return dao.modifyComment(c);
	}

	public int deleteComment(Comment c) {
		// TODO Auto-generated method stub
		return dao.deleteComment(c);
	}

	public int checkCommentCount(Comment c) {
		// TODO Auto-generated method stub
		return dao.checkCommentCount(c);
	}
}
