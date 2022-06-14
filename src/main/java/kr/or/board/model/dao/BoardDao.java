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
		public int selectCommentCount(HashMap<String, Object> commentMap) {
			int totalCount = sqlSession.selectOne("board.selectCommentCount",commentMap);
			return totalCount;
		}
		public int selectOrderCount(HashMap<String, Object> orderMap) {
			int totalCount = sqlSession.selectOne("board.selectOrderCount",orderMap);
			return totalCount;
		}
		public int selectLikeCount(HashMap<String, Object> likeMap) {
			int totalCount = sqlSession.selectOne("board.selectLikeCount",likeMap);
			return totalCount;
		}
		public int selectQnaCount(HashMap<String, Object> qnaMap) {
			int totalCount = sqlSession.selectOne("board.selectQnaRealCount",qnaMap);
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
		public ArrayList<String> getQnaList(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			List list = sqlSession.selectList("board.getQnaList", map);
			return (ArrayList<String>)list;
		}
		public int insertQna(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return sqlSession.insert("board.insertQna",map);
		}
		public int insertQnaRe(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return sqlSession.insert("board.insertQnaRe",map);
		}
		public int selectSeller(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("board.selectSeller",map);
		}
		public ArrayList<Board> selectProjectList(int memberNo) {
			List projecList = sqlSession.selectList("board.selectProject",memberNo);
			return (ArrayList<Board>)projecList;
		}
	}
