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
import kr.or.common.model.vo.Order;
import kr.or.member.model.vo.Member;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
	
	@RequestMapping(value="/commentList.kh")
	public String commentList(int reqPage, Model model, Member m) {
		CommentPageData cpd = service.selectCommentList(reqPage, m.getMemberNo());
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
	public String orderList(int reqPage, Model model, Member m) {
		OrderPageData opd = service.selectOrderList(reqPage, m.getMemberNo());
		model.addAttribute("orderList",opd.getOrderList());
		model.addAttribute("pageNavi",opd.getPageNavi());
		model.addAttribute("reqPage",reqPage);
		return "board/orderList";
	}
	
	@RequestMapping(value="/qnaList.kh")
	public String qnaList(int reqPage, Model model, Member m) {
		QnaPageData qpd = service.selectQnaList(reqPage, m.getMemberNo());
		model.addAttribute("qnaList",qpd.getQnaList());
		model.addAttribute("pageNavi",qpd.getPageNavi());
		model.addAttribute("reqPage",reqPage);
		return "board/qnaList";
	}
	
	@RequestMapping(value="/likeList.kh")
	public String likeList(int reqPage, Model model, Member m) {
		LikePageData lpd = service.selectLikeList(reqPage, m.getMemberNo());
		model.addAttribute("likeList",lpd.getLikeList());
		model.addAttribute("pageNavi",lpd.getPageNavi());
		model.addAttribute("reqPage",reqPage);
		return "board/likeList";
	}
	
	
	@RequestMapping(value = "/orderView.kh")
	public String orderView(int orderNo, Model model) {
		Order order = service.selectOneOrder(orderNo);
		model.addAttribute("order", order);
		return "board/orderView";
	}
	@RequestMapping(value = "/modifyOrder.kh")
	public String modifyOrder(int orderNo, Model model) {
		Order order = service.selectOneOrder(orderNo);
		model.addAttribute("order", order);
		return "board/modifyOrder";
	}
	
	@RequestMapping(value = "/updateOrder.kh")
	public String updateOrder(Order o, Model model) {
		int result = service.updateOrder(o);
		
		if(result>0) {
			model.addAttribute("title", "주문정보 수정 완료");
			model.addAttribute("msg", "주문정보가 수정되었습니다");
			model.addAttribute("icon", "success");
			model.addAttribute("loc", "/orderView.kh?orderNo="+o.getOrderNo());
		}else {
			model.addAttribute("title", "주문정보 수정 실패");
			model.addAttribute("msg", "수정에 실패했습니다. 관리자에게 문의해 주세요!");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/orderView.kh?orderNo="+o.getOrderNo());
		}
		return "common/msg";
	}
}
