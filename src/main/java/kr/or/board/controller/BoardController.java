package kr.or.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.board.model.service.BoardService;
import kr.or.board.model.vo.CommentPageData;
import kr.or.board.model.vo.LikePageData;
import kr.or.board.model.vo.OrderPageData;
import kr.or.board.model.vo.QnaPageData;

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
	public String orderList(int reqPage, Model model, int memberNo) {
		OrderPageData opd = service.selectOrderList(reqPage, memberNo);
		model.addAttribute("ordertList",opd.getOrderList());
		model.addAttribute("pageNavi",opd.getPageNavi());
		model.addAttribute("reqPage",reqPage);
		return "board/orderList";
	}
	
	@RequestMapping(value="/qnaList.kh")
	public String qnaList(int reqPage, Model model, int memberNo) {
		QnaPageData qpd = service.selectQnaList(reqPage, memberNo);
		model.addAttribute("qnatList",qpd.getQnaList());
		model.addAttribute("pageNavi",qpd.getPageNavi());
		model.addAttribute("reqPage",reqPage);
		return "board/qnaList";
	}
	
	@RequestMapping(value="/likeList.kh")
	public String likeList(int reqPage, Model model, int memberNo) {
		LikePageData lpd = service.selectLikeList(reqPage, memberNo);
		model.addAttribute("likeList",lpd.getLikeList());
		model.addAttribute("pageNavi",lpd.getPageNavi());
		model.addAttribute("reqPage",reqPage);
		return "board/likeList";
	}
	
}
