package kr.or.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.board.model.dao.BoardDao;
import kr.or.board.model.vo.CommentPageData;
import kr.or.board.model.vo.LikePageData;
import kr.or.board.model.vo.OrderPageData;
import kr.or.board.model.vo.QnaPageData;
import kr.or.common.model.vo.Comment;

@Service
public class BoardService {
	@Autowired
	BoardDao dao;

	public CommentPageData selectCommentList(int reqPage, int memberNo) {
		String boardName = "comment_tbl";
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
		//totalCount = 전체 게시물 수 
		HashMap<String, Object> commentMap = new HashMap<String, Object>();
		commentMap.put("boardName",boardName);
		commentMap.put("memberNo",memberNo);
		int totalCount = dao.selectCount(commentMap);
		//totalPage = 전체 페이지 수
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		//pageNaviSize = 페이지 네비 길이 / pageNo = 페이지 번호
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		//pageNavi 생성시작
		String pageNavi = "<ul class='pagination circle-style'>";
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/commentList.kh?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-item' href='/commentList.kh?reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi +="</a></li>"; 
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/commentList.kh?reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi +="</a></li>"; 
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<a class='page-item' href='/commentList.kh?reqPage="+(pageNo+1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		CommentPageData cpd = new CommentPageData(commentList, pageNavi);
		return cpd;
	}

	public OrderPageData selectOrderList(int reqPage, int memberNo) {
		// TODO Auto-generated method stub
		return null;
	}

	public LikePageData selectLikeList(int reqPage, int memberNo) {
		// TODO Auto-generated method stub
		return null;
	}

	public QnaPageData selectQnaList(int reqPage, int memberNo) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
