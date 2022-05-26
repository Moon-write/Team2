package kr.or.group.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.group.model.vo.Group;

@Repository
public class GroupDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertGroup(Group group) {
		return sqlSession.insert("group.insertGroup", group);
	}

}
