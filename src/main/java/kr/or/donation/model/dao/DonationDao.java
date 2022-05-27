package kr.or.donation.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.donation.model.vo.Donation;



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

	public Donation selectOneDonation(Donation d) {
		// TODO Auto-generated method stub
		Donation donation = sqlSession.selectOne("donation.selectOneDonation",d);
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


}
