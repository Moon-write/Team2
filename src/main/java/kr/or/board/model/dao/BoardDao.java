	package kr.or.board.model.dao;

	import java.util.ArrayList;
	import java.util.HashMap;
	import java.util.List;

	import org.mybatis.spring.SqlSessionTemplate;
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Repository;

import kr.or.board.model.vo.Board;
import kr.or.common.model.vo.Comment;
	import kr.or.common.model.vo.Like;
	import kr.or.common.model.vo.Order;
import kr.or.common.model.vo.OrderProduct;
import kr.or.common.model.vo.Qna;

	@Repository
	public class BoardDao {
		@Autowired
		SqlSessionTemplate sqlSession;

		public ArrayList<Board> selectCommentList(HashMap<String, Object> map) {
			List commentList = sqlSession.selectList("board.selectCommentList",map);
			return (ArrayList<Board>)commentList;
		}
		public ArrayList<Board> selectOrderList(HashMap<String, Object> map) {
			List orderList = sqlSession.selectList("board.selectOrderList",map);
			return (ArrayList<Board>)orderList;
		}
		public ArrayList<Board> selectLikeList(HashMap<String, Object> map) {
			List likeList = sqlSession.selectList("board.selectLikeList",map);
			return (ArrayList<Board>)likeList;
		}
		public ArrayList<Board> selectQnaList(HashMap<String, Object> map) {
			List qnaList = sqlSession.selectList("board.selectQnaList",map);
			return (ArrayList<Board>)qnaList;
		}
		public int selectCommentCount(int memberNo) {
			int totalCount = sqlSession.selectOne("board.selectCommentCount",memberNo);
			return totalCount;
		}
		public int selectOrderCount(int memberNo) {
			int totalCount = sqlSession.selectOne("board.selectOrderCount",memberNo);
			return totalCount;
		}
		public int selectLikeCount(int memberNo) {
			int totalCount = sqlSession.selectOne("board.selectLikeCount",memberNo);
			return totalCount;
		}
		public int selectQnaCount(int memberNo) {
			int totalCount = sqlSession.selectOne("board.selectQnaCount",memberNo);
			return totalCount;
		}
		public Order selectOneOrder(int orderNo) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("board.selectOneOrder", orderNo);
		}
		public ArrayList<OrderProduct> selectOrderProduct(Order order) {
			List list = sqlSession.selectList("board.selectOrderProduct", order);
			return (ArrayList<OrderProduct>)list;
		}
		public int updateOrder(Order o) {
			// TODO Auto-generated method stub
			return sqlSession.update("board.updateOrder", o);
		}
	}
