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

	public ArrayList<Auction> selectAuctionList(HashMap<String, Object> map) {
		List<Auction> list = sqlSession.selectList("auction.selectAuctionList", map);
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

	public int addLike(HashMap<String, Object> map) {
		
		return sqlSession.insert("auction.addLike",map);
	}

	public int removeLike(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.delete("auction.removeLike",map);
	}

	public List<Integer> selectLikeList(HashMap<String, Object> map) {
		List<Integer> list = sqlSession.selectList("auction.selectLikeList", map);
		return list; 
	}

	public ArrayList<Auction> getLikeAuction(List<Integer> projectlist) {
		List<Auction> list= sqlSession.selectList("auction.getLikeAuction", projectlist);
		return (ArrayList<Auction>) list;
	}

	public int checkPageCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("auction.checkPageCount", map);
	}

	public int getBidCount(int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("auction.getBidCount", projectNo);
	}

	public int getMinBidPrice(int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("auction.getMinBidPrice", projectNo);
	}

	public int checkMyLikeCount(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("auction.checkMyLikeCount", memberNo);
	}

	public ArrayList<Auction> selectAuctionListbyLike(HashMap<String, Object> map) {
		List<Auction> list = sqlSession.selectList("auction.selectAuctionListbyLike", map);
		return (ArrayList<Auction>) list;
	}

	public ArrayList<Bid> getBidHistory(int projectNo) {
		List<Bid> list = sqlSession.selectList("auction.getBidHistory", projectNo);
		return (ArrayList<Bid>) list;
	}
}
