package kr.or.donation.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.common.model.vo.Order;
import kr.or.donation.model.vo.Donation;
import kr.or.donation.model.vo.DonationComment;
import kr.or.member.model.vo.Member;



@Repository
public class DonationDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertDonation(Donation d) {
		// TODO Auto-generated method stub
		return sqlSession.insert("donation.insertDonation", d);
	}

	public int updateDonation(Donation d) {
		// TODO Auto-generated method stub
		return sqlSession.update("donation.updateDonation", d);
	}

	public ArrayList<Donation> selectDonationList() {
		List list = sqlSession.selectList("donation.selectDonationList");
		return (ArrayList<Donation>)list;
	}

	public Donation selectOneDonation(int projectNo) {
		// TODO Auto-generated method stub
		Donation donation = sqlSession.selectOne("donation.selectOneDonation",projectNo);
		return donation;
	}

	public ArrayList<Donation> selectHashtag(String donationCategory) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("donation.selectHashtag",donationCategory);
		return (ArrayList<Donation>)list;
	}

	public int selectsumDonationCategory(String donationCategory) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("donation.selectsumDonationCategory",donationCategory);
	}

	public Member selectOneMember(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("donation.selectOneMember",memberNo);
	}

	public int insertDonationComment(DonationComment dc) {
		// TODO Auto-generated method stub
		return sqlSession.insert("donation.insertDonationComment",dc);
	}

	public ArrayList<DonationComment> selectDonationComment(int selectProjectNo) {
		List list = sqlSession.selectList("donation.selectDonationCommentList",selectProjectNo);
		return (ArrayList<DonationComment>)list;
	}

	public int donationCommentDelete(DonationComment dc) {
		// TODO Auto-generated method stub
		return sqlSession.delete("donation.donationCommentDelete",dc);
	}

	public int checkViewCount(int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("donation.checkViewCount", projectNo);
	}

	public int selectCashListPriceSum() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("donation.selectCashListPriceSum");
	}

	public int selectGeneralListPriceSum() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("donation.selectGeneralListPriceSum");
	}

	public Integer selectOneOrderProjectNo(int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("donation.selectOneOrderProjectNo",projectNo);
	}

	public int insertDonationOrder(Order donationOrder) {
		// TODO Auto-generated method stub
		return sqlSession.insert("donation.insertDonationOrder",donationOrder);
	}


}
