package kr.or.auction.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.auction.model.dao.AuctionDao;
import kr.or.auction.model.vo.Auction;
import kr.or.auction.model.vo.AuctionInfo;
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
		if(memberNo!=0) {
			for(Auction a : list) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("projectNo", a.getProjectNo());
				map.put("memberNo", memberNo);
				int result = 0;
				
				result = dao.getLike(map);
				if(result==1) {
					// 좋아요가 있으면
					a.setLike(1);
				}
			}
		}
		return list;
	}

	public Auction selectAuction(int projectNo, int memberNo) {
		Auction a = dao.selectAuction(projectNo);
		
		if(memberNo!=0) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("projectNo", projectNo);
			map.put("memberNo", memberNo);
			int result = 0;
			
			result = dao.getLike(map);
			if(result!=9999) {
				// 좋아요가 있으면
				a.setLike(1);
			}
		}
		return a;
	}

	public AuctionInfo selectAuctionInfo(int projectNo) {
		AuctionInfo info = new AuctionInfo();
		// 입찰리스트
		
		// 좋아요갯수
		
		// 판매자정보 가져오기
		
		// 최고가와 입찰건수 리턴
		return info;
	}

	public int insertBid(Bid b) {
		int result = dao.insertBid(b);
		
		// 순위변동 업데이트
		return result;
	}
}
