package kr.or.business.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.auction.model.vo.Auction;
import kr.or.common.model.vo.Order;
import kr.or.donation.model.vo.Donation;
import kr.or.funding.model.vo.Funding;
import kr.or.group.model.vo.Group;

@Repository
public class BusinessDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Funding> selectFdList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectFdList", memberNo);
		return (ArrayList<Funding>) list;
	}

	public ArrayList<Donation> selectDnList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectDnList", memberNo);
		return (ArrayList<Donation>) list;
	}

	public ArrayList<Donation> selectExpiredDnList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectExpiredDnList", memberNo);
		return (ArrayList<Donation>) list;
	}
	
	public ArrayList<Group> selectGrList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectGrList", memberNo);
		return (ArrayList<Group>) list;
	}

	public ArrayList<Auction> selectAucList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectAucList", memberNo);
		return (ArrayList<Auction>) list;
	}

	public Auction selectBestPrice(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("business.selectBestPrice", map);
	}

	public ArrayList<Auction> selectExpiredAucList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectExpiredAucList", memberNo);
		return (ArrayList<Auction>) list;
	}

	public int deleteAuction(int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("business.deleteAuction",projectNo);
	}

	public int checkDnOrder(int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("business.checkDnOrder",projectNo);
	}

	public int deleteDonation(int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("business.deleteDonation",projectNo);
	}

	
}
