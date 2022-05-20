package kr.or.auction.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.auction.model.dao.AuctionDao;
import kr.or.auction.model.vo.Auction;
import kr.or.auction.model.vo.Bid;

@Service
public class AuctionService {

	@Autowired
	private AuctionDao dao;

	public int insertAuction(Auction auction) {
		return dao.insertAuction(auction);
	}

	public ArrayList<Auction> selectAuctionList(int memberNo) {
		ArrayList<Auction> list = dao.selectAuctionList();
		//memberNo가 0이면 그냥지나감
		for(Auction a : list) {
			a = getMoreInfo(a, memberNo);
		}
		return list;
	}

	public Auction selectAuction(int projectNo, int memberNo) {
		// 조회수체크
		dao.checkViewCount(projectNo);
				
		Auction a = dao.selectAuction(projectNo);
		a = getMoreInfo(a, memberNo);	

		return a;
	}
	
	public Auction getMoreInfo(Auction a, int memberNo) {
		ArrayList<Bid> list = dao.getBidList(a.getProjectNo());
		System.out.println("여기1");
		// 최고가 알아내기 - 기본셋팅은 최저가
		int bestPrice = a.getAuctionPrice();
		
		if(list!=null) {
			a.setBidCount(list.size());
			for(int i=0;i<list.size();i++) {
				System.out.println("접근?");
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
		System.out.println("여기2");
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
		System.out.println("여기3");
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
			}else {
				// 원래 안정권이 아니었다면 - 그 이후로는 그대로 넘어감
				break;
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
}
