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
	public ArrayList<String> selectPopKeyList() {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("common.selectPopKeyList");
		return (ArrayList<String>)list;
	}

	public int insertPopKey(String keyword) {
		// TODO Auto-generated method stub
		return sqlSession.insert("common.insertPopKey",keyword);
	}

	public int deleteKeyword() {
		// TODO Auto-generated method stub
		return sqlSession.delete("common.deleteKeyword");
	}
}
