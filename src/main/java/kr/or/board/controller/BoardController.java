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
		return "member/mypageCommentList";
	}
	
}
