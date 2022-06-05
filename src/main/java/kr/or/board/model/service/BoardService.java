package kr.or.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.board.model.dao.BoardDao;
import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.CommentPageData;
import kr.or.board.model.vo.LikePageData;
import kr.or.board.model.vo.OrderPageData;
import kr.or.board.model.vo.QnaPageData;
import kr.or.common.model.vo.Comment;
import kr.or.common.model.vo.Like;
import kr.or.common.model.vo.Order;
import kr.or.common.model.vo.Qna;

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
		ArrayList<Board> commentList = dao.selectCommentList(map);
		
		//pageNavi작성
		//totalCount = 전체 게시물 수 
		HashMap<String, Object> commentMap = new HashMap<String, Object>();
		commentMap.put("boardName",boardName);
		commentMap.put("memberNo",memberNo);
		int totalCount = dao.selectCommentCount(commentMap);
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
		//첫페이지 버튼
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<li><a class='page-item' href='/commentList.kh?memberNo="+memberNo+"&reqPage=1'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>keyboard_double_arrow_left</span></a></li>";
			pageNavi += "<li><a class='page-item' href='/commentList.kh?memberNo="+memberNo+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>chevron_left</span></a></li>";
		}
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li><a class='page-item active-page' href='/commentList.kh?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi +="</a></li>"; 
			}else {
				pageNavi += "<li><a class='page-item' href='/commentList.kh?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi +="</a></li>"; 
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		//마지막페이지 버튼
		if(pageNo<=totalPage) {
			pageNavi += "<li><a class='page-item' href='/commentList.kh?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>chevron_right</span></a></li>";
			pageNavi += "<li><a class='page-item' href='/commentList.kh?memberNo="+memberNo+"&reqPage="+totalPage+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>keyboard_double_arrow_right</span></a></li>";
		}
		pageNavi += "</ul>";
		System.out.println("comment의 totalPage : "+totalPage);
		System.out.println("comment의 totalCount : "+totalCount);
		System.out.println("comment의 pageNo : "+pageNo);
		CommentPageData cpd = new CommentPageData(commentList, pageNavi);
		return cpd;
	}

	public OrderPageData selectOrderList(int reqPage, int memberNo) {
		String boardName = "order_tbl";
		//numPerPage = 한 페이지당 게시물 수 / end = 해당 페이지 마지막 게시물 번호 / start = 해당 페이지 첫번째 게시물 번호
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		//start,end로 게시물 목록조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("memberNo",memberNo);
		ArrayList<Board> orderList = dao.selectOrderList(map);
		
		//pageNavi작성
		//totalCount = 전체 게시물 수 
		HashMap<String, Object> orderMap = new HashMap<String, Object>();
		orderMap.put("boardName",boardName);
		orderMap.put("memberNo",memberNo);
		int totalCount = dao.selectOrderCount(orderMap);
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
		//첫페이지 버튼
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<li><a class='page-item' href='/orderList.kh?memberNo="+memberNo+"&reqPage=1'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>keyboard_double_arrow_left</span></a></li>";
			pageNavi += "<li><a class='page-item' href='/orderList.kh?memberNo="+memberNo+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>chevron_left</span></a></li>";
		}
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li><a class='page-item active-page' href='/orderList.kh?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi +="</a></li>"; 
			}else {
				pageNavi += "<li><a class='page-item' href='/orderList.kh?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi +="</a></li>"; 
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		//마지막페이지 버튼
		if(pageNo<=totalPage) {
			pageNavi += "<li><a class='page-item' href='/orderList.kh?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>chevron_right</span></a></li>";
			pageNavi += "<li><a class='page-item' href='/orderList.kh?memberNo="+memberNo+"&reqPage="+totalPage+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>keyboard_double_arrow_right</span></a></li>";
		}
		pageNavi += "</ul>";
		System.out.println("order의 totalPage : "+totalPage);
		System.out.println("order의 totalCount : "+totalCount);
		System.out.println("order의 pageNo : "+pageNo);
		OrderPageData opd = new OrderPageData(orderList, pageNavi);
		return opd;
	}

	public LikePageData selectLikeList(int reqPage, int memberNo) {
		String boardName = "like_tbl";
		//numPerPage = 한 페이지당 게시물 수 / end = 해당 페이지 마지막 게시물 번호 / start = 해당 페이지 첫번째 게시물 번호
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		//start,end로 게시물 목록조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("memberNo",memberNo);
		ArrayList<Board> likeList = dao.selectLikeList(map);
		
		//pageNavi작성
		//totalCount = 전체 게시물 수 
		HashMap<String, Object> likeMap = new HashMap<String, Object>();
		likeMap.put("boardName",boardName);
		likeMap.put("memberNo",memberNo);
		int totalLikeCount = dao.selectLikeCount(likeMap);
		//totalPage = 전체 페이지 수
		int totalPage = 0;
		if(totalLikeCount % numPerPage == 0) {
			totalPage = totalLikeCount/numPerPage;
		}else {
			totalPage = totalLikeCount/numPerPage + 1;
		}

		//pageNaviSize = 페이지 네비 길이 / pageNo = 페이지 번호
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		//pageNavi 생성시작
		String pageNavi = "<ul class='pagination circle-style'>";
		//첫페이지 버튼
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<li><a class='page-item' href='/likeList.kh?memberNo="+memberNo+"&reqPage=1'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>keyboard_double_arrow_left</span></a></li>";
			pageNavi += "<li><a class='page-item' href='/likeList.kh?memberNo="+memberNo+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>chevron_left</span></a></li>";
		}
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li><a class='page-item active-page' href='/likeList.kh?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi +="</a></li>"; 
			}else {
				pageNavi += "<li><a class='page-item' href='/likeList.kh?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi +="</a></li>"; 
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		//마지막페이지 버튼
		if(pageNo<=totalPage) {
			pageNavi += "<li><a class='page-item' href='/likeList.kh?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>chevron_right</span></a></li>";
			pageNavi += "<li><a class='page-item' href='/likeList.kh?memberNo="+memberNo+"&reqPage="+totalPage+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>keyboard_double_arrow_right</span></a></li>";
		}
		pageNavi += "</ul>";
		System.out.println("like의 totalPage : "+totalPage);
		System.out.println("like의 totalCount : "+totalLikeCount);
		System.out.println("like의 pageNo : "+pageNo);
		LikePageData lpd = new LikePageData(likeList, pageNavi);
		return lpd;
	}

	public QnaPageData selectQnaList(int reqPage, int memberNo) {
		String boardName = "qna_tbl";
		//numPerPage = 한 페이지당 게시물 수 / end = 해당 페이지 마지막 게시물 번호 / start = 해당 페이지 첫번째 게시물 번호
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		//start,end로 게시물 목록조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("memberNo",memberNo);
		ArrayList<Board> qnaList = dao.selectQnaList(map);
		
		//pageNavi작성
		//totalCount = 전체 게시물 수 
		HashMap<String, Object> qnaMap = new HashMap<String, Object>();
		qnaMap.put("boardName",boardName);
		qnaMap.put("memberNo",memberNo);
		int totalCount = dao.selectQnaCount(qnaMap);
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
		//첫페이지 버튼
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<li><a class='page-item' href='/qnaList.kh?memberNo="+memberNo+"&reqPage=1'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>keyboard_double_arrow_left</span></a></li>";
			pageNavi += "<li><a class='page-item' href='/qnaList.kh?memberNo="+memberNo+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>chevron_left</span></a></li>";
		}
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li><a class='page-item active-page' href='/qnaList.kh?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi +="</a></li>"; 
			}else {
				pageNavi += "<li><a class='page-item' href='/qnaList.kh?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi +="</a></li>"; 
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		//마지막페이지 버튼
		if(pageNo<=totalPage) {
			pageNavi += "<li><a class='page-item' href='/qnaList.kh?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>chevron_right</span></a></li>";
			pageNavi += "<li><a class='page-item' href='/qnaList.kh?memberNo="+memberNo+"&reqPage="+totalPage+"'>";
			pageNavi += "<span class='material-symbols-outlined material-icons'>keyboard_double_arrow_right</span></a></li>";
		}
		pageNavi += "</ul>";
		System.out.println("qna의 totalPage : "+totalPage);
		System.out.println("qna의 totalCount : "+totalCount);
		System.out.println("qna의 pageNo : "+pageNo);
		QnaPageData qpd = new QnaPageData(qnaList, pageNavi);
		return qpd;
	}

	public Order selectOneOrder(int orderNo) {
		Order order = dao.selectOneOrder(orderNo);
		order.setOrderProductList(dao.selectOrderProduct(order));
		return order;
	}
	
}
