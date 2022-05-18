package kr.or.auction.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.auction.model.dao.AuctionDao;
import kr.or.auction.model.vo.Auction;

@Service
public class AuctionService {

	@Autowired
	private AuctionDao dao;

	public int insertAuction(Auction auction) {
		return dao.insertAuction(auction);
	}

	public ArrayList<Auction> selectAuctionList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectAuctionList(memberNo);
	}
}
