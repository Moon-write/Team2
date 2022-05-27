package kr.or.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.common.model.vo.Comment;

@Repository
public class BoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	public ArrayList<Comment> selectCommentList(HashMap<String, Object> map) {
		List commentList = sqlSession.selectList("board.selectCommentList",map);
		return (ArrayList<Comment>)commentList;
	}

	public int selectCount(HashMap<String, Object> commentMap) {
		int totalCount = sqlSession.selectOne("board.selectCount",commentMap);
		return totalCount;
	}
}
