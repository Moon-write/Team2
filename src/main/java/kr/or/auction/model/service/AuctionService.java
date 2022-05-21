package kr.or.auction.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.auction.model.dao.AuctionDao;
import kr.or.auction.model.vo.Auction;
import kr.or.auction.model.vo.AuctionList;
import kr.or.auction.model.vo.Bid;

@Service
public class AuctionService {

	@Autowired
	private AuctionDao dao;

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
	
	public AuctionList selectAuctionList(int memberNo, int reqPage, int endFlag, int order, String searchKeyword) {
		AuctionList auctionList = new AuctionList();	
		
		
		// 페이지설정
		// 한페이지당 컨텐츠수
		int rowOflist = 5;
		// 시작컨텐츠번호
		int startNum = rowOflist * (reqPage-1) +1;
		// 끝컨텐츠번호
		int endNum = rowOflist * reqPage ;
	
		
		// 링크이동구문
		String link = "/auctionList.kh?endFlag="+endFlag+"&order="+order+"&searchKeyword="+searchKeyword+"&reqPage=";
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("order", order);
		map.put("keyword", searchKeyword);
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
		for(int i = 0;i< ((pageEnd<5)? pageEnd : 5);i++) {
			if(reqPage == (int)(pageStart+i)) {
				pagination += "<li><a class='page-item active-page' href='"+link+(reqPage)+"'>"+(int)reqPage+"</a></li>";
			}else {
				pagination += "<li><a class='page-item' href='"+link+(int)(pageStart+i)+"'>"+(int)(pageStart+i)+"</a></li>";				
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
		}
		auctionList.setAuctionList(list);		
		auctionList.setPagination(pagination);		
		
		return auctionList;
	}

	public Auction getMoreInfo(Auction a, int memberNo) {
		ArrayList<Bid> list = dao.getBidList(a.getProjectNo());
		a.setBidList(list);
		// 최고가 알아내기 - 기본셋팅은 최저가
		int bestPrice = a.getAuctionPrice();
		
		if(list!=null) {
			a.setBidCount(list.size());
			for(int i=0;i<list.size();i++) {
				if(list.get(i).getBidSuccess()==0) {
					bestPrice = list.get(i-1).getBidPrice();
					break;
				}
			}
			a.setBestPrice(bestPrice);
		}else {
			a.setBidCount(0);
		}
		a.setTotallike(dao.getTotalLike(a.getProjectNo()));

		if(memberNo!=0) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("projectNo", a.getProjectNo());
			map.put("memberNo", memberNo);
							
			int	result = dao.getLike(map);
			if(result!=9999) {
				// 좋아요가 있으면
				a.setLike(1);
			}
		}		

		return a;
	}
	
	public int insertBid(Bid b) {
		// 시간이 남았는지 체크하기
		int result = dao.checkEndTime(b.getProjectNo());
		
		// 시간이 남았을때만(양수일때만 입찰가능)
		if(result>0) {
			result = dao.insertBid(b);
		}else {
			return -3;
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
						bidList.get(i).setBidSuccess(2);
						notifyMemberList.add(bidList.get(i).getMemberNo());
					}
									
				}else{
					// 완전낙찰일때
					result = updateBidRank(bidList.get(i), 0);
					if(result>0) {
						bidList.get(i).setBidSuccess(0);
						notifyMemberList.add(bidList.get(i).getMemberNo());
					}
				}
			}
		} // for문 종료
		// 알림보내는 웹소켓 낄려면 여기
		return result;
	}
	
	public int updateBidRank(Bid bid, int successRange){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bidNo",bid.getBidNo());
		map.put("successRange", successRange);
		int result = dao.updateBidRank(map);
		
		return result;
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
}
