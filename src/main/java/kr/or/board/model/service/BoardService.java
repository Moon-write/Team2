package kr.or.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.board.model.dao.BoardDao;
import kr.or.board.model.vo.CommentPageData;
import kr.or.common.model.vo.Comment;

@Service
public class BoardService {
	
	@Autowired
	BoardDao dao;

	public CommentPageData selectCommentList(int reqPage, int memberNo) {
		int divNo = 1;
		/*
		 * reqPage = 요청페이지
		 * start/end = 게시글 시작번호 / 끝번호
		 * totalPage = 총게시글숫자
		 * pageNaviSize = 페이지 네비 길이
		 * pageNavi = 페이지 네비
		 * numPerPage = 페이지당 글자수
		 */
		//numPerPage = 한 페이지당 게시물 수 / end = 해당 페이지 마지막 게시물 번호 / start = 해당 페이지 첫번째 게시물 번호
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		//start,end로 게시물 목록조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("memberNo",memberNo);
		ArrayList<Comment> commentList = dao.selectCommentList(map);
		
		//pageNavi작성
		//totalCount = 전체게시물 수 / totalPage = 전체 페이지 수 
		int totalCount = dao.selectCommentCount(divNo);
		
		
		
		
		
		
		
		return null;
	}

	
}
