package kr.or.common.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.common.model.vo.Project;

@Repository
public class CommonDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Project> searchProject(String keyword) {
		List<Project> list = sqlSession.selectList("common.searchProject", keyword);
		return (ArrayList<Project>) list;
	}
	
}
