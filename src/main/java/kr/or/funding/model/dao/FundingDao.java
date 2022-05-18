package kr.or.funding.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FundingDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
