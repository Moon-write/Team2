package kr.or.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.common.model.vo.Comment;
import kr.or.common.model.vo.Like;
import kr.or.common.model.vo.Order;
import kr.or.common.model.vo.Qna;

@Repository
public class BoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	public ArrayList<Comment> selectCommentList(HashMap<String, Object> map) {
		List commentList = sqlSession.selectList("board.selectCommentList",map);
		return (ArrayList<Comment>)commentList;
	}
	public ArrayList<Order> selectOrderList(HashMap<String, Object> map) {
		List orderList = sqlSession.selectList("board.selectOrderList",map);
		return (ArrayList<Order>)orderList;
	}
	public ArrayList<Like> selectLikeList(HashMap<String, Object> map) {
		List likeList = sqlSession.selectList("board.selectLikeList",map);
		return (ArrayList<Like>)likeList;
	}
	public ArrayList<Qna> selectQnaList(HashMap<String, Object> map) {
		List qnaList = sqlSession.selectList("board.selectQnaList",map);
		return (ArrayList<Qna>)qnaList;
	}
	public int selectCount(HashMap<String, Object> commentMap) {
		int totalCount = sqlSession.selectOne("board.selectCount",commentMap);
		return totalCount;
	}
}
