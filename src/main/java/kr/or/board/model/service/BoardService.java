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
		//totalCount = 전체 게시물 수 / totalPage = 전체 페이지 수 
		HashMap<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("divNo", divNo);
		countMap.put("memberNo", memberNo);
		int totalCount = dao.selectCommentCount(countMap);
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		//pageNaviSize = 페이지 네비 길이 / pageNo = 페이지 번호
		int pageNaviSize = 10;
		int pageNo = 1;
		
		//pageNavi 생성시작
		String pageNavi = "";
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<a href='/commentList.kh?reqPage="+(reqPage-1)+"'></a>";
		}
		//페이지번호생성
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/commentList.kh?reqPage="+pageNo+"'>"+pageNo+"</a>"; 
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<a href='/commentList.kh?reqPage="+(reqPage+1)+"'></a>";
		}
		CommentPageData cpd = new CommentPageData(commentList, pageNavi);
		return cpd;
	}

	
}
