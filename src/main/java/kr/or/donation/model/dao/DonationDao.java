package kr.or.donation.model.dao;

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
}
