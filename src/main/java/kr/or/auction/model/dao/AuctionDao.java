package kr.or.auction.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.auction.model.vo.Auction;
import kr.or.auction.model.vo.Bid;

@Repository
public class AuctionDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertAuction(Auction auction) {
		return sqlSession.insert("auction.insertAuction", auction);
	}

	public ArrayList<Auction> selectAuctionList() {
		List<Auction> list = sqlSession.selectList("auction.selectAuctionList");
		return (ArrayList<Auction>) list;
	}

	public Auction selectAuction(int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("auction.selectAuction", projectNo);
	}

	public int getLike(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("auction.getLike", map);
	}

	public int insertBid(Bid b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("auction.insertBid", b);
	}

	public int checkEndTime(int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("auction.checkEndTime", projectNo);
	}

	public int checkViewCount(int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("auction.checkViewCount", projectNo);
	}

	public ArrayList<Bid> getBidList(int projectNo) {
		List<Bid> list = sqlSession.selectList("auction.getBidList", projectNo);
		return (ArrayList<Bid>) list;
	}

	public int getTotalLike(int projectNo) {
		int result = sqlSession.selectOne("auction.getTotalLike", projectNo);
		return result;
	}

	public int updateBidRank(HashMap<String, Object> map) {
		
		return sqlSession.update("auction.updateBidRank", map);
	}
}
