package kr.or.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.board.model.service.BoardService;
import kr.or.board.model.vo.CommentPageData;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
	
	@RequestMapping(value="/commentList.kh")
	public String commentList(int reqPage, Model model, int memberNo) {
		CommentPageData cpd = service.selectCommentList(reqPage, memberNo);
		model.addAttribute("commentList",cpd.getCommentList());
		model.addAttribute("pageNavi",cpd.getPageNavi());
		model.addAttribute("reqPage",reqPage);
		return "board/commentList";
	}
	
	@RequestMapping(value="/projectList.kh")
	public String projectList() {
		return "board/projectList";
	}
	
	@RequestMapping(value="/orderList.kh")
	public String orderList() {
		return "board/orderList";
	}
	
	@RequestMapping(value="/qnaList.kh")
	public String qnaList() {
		return "board/qnaList";
	}
	
	@RequestMapping(value="/likeList.kh")
	public String likeList() {
		return "board/likeList";
	}
	
}
