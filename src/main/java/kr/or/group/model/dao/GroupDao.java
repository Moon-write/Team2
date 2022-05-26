package kr.or.group.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GroupDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
