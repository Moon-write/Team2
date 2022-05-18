package kr.or.donation.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DonationDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
