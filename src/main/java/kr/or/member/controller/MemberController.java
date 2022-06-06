package kr.or.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.board.model.vo.CommentPageData;
import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="/loginFrm.kh")
	public String loginFrm() {
		return "member/loginFrm";
	}
	@RequestMapping(value="/login.kh")
	public String login(Member m, HttpSession session) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			session.setAttribute("m", member);
			request.setAttribute("title", "로그인성공");
			request.setAttribute("msg", "환영합니다!");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "로그인실패");
			request.setAttribute("msg", "아이디나 비밀번호를 확인하세요.");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/");
		return "common/msg";
	}
	@RequestMapping(value="/logout.kh")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping(value="/selectOneMember.kh")
	public String searchOneMember(Member m, Model model) {
		Member member = service.selectOneMember(m);
		model.addAttribute("m",member);
		return "member/searchMember";
	}
	@RequestMapping(value = "/joinSelect.kh")
	public String joinSelect() {
		return "member/joinSelect";
	}
	@RequestMapping(value="/joinFrmMember.kh")
	public String joinFrmMember() {
		return "member/joinFrmMember";
	}
	@RequestMapping(value="/joinFrmBiz.kh")
	public String joinFrmBiz() {
		return "member/joinFrmBiz";
	}
	@RequestMapping(value="/joinMember.kh")
	public String joinMember(Member m) {
		int result = service.insertMember(m);
		return "member/joinMember";
	}
	@RequestMapping(value="/mypageMain.kh")
	public String mypageMain() {
		return "member/mypageMain";
	}
	@RequestMapping(value="/updatePwFrm.kh")
	public String changePwFrm() {
		return "member/updatePwFrm";
	}
	@RequestMapping(value="/pwChange.kh")
	public String pwChange(Member m, String memberPwNew) {
		int result = service.changePw(m,memberPwNew);
		if(result == -1) {
			return "member/changePwFrm";
		}else if(result > 0){
			return "redirect:/";
		}else {
			return "member/changePwFrm";
		}
	}
	@ResponseBody
	@RequestMapping(value="/idCheck.kh")
	public String idCheck(String memberId) { 
		Member m = null;
		m.setMemberId(memberId);
		Member member = service.selectOneMember(m);
		if(member == null) {
			return "0";
		}else {
			return "1";
		}
	}
	@ResponseBody
	@RequestMapping(value="/pwcheck.kh")
	public String selectOneMember(Member m) {
		Member member = service.selectOneMember(m);
		if(member != null) {//비밀번호 일치할때
			return "0";
		}else {
			return "1";
		}
	}
	@RequestMapping(value="deleteMemberFrm.kh")
	public String deleteMemberFrm() {
		return "member/deleteMemberFrm";
	}
	@RequestMapping(value="deleteMember.kh")
	public String deleteMember(@SessionAttribute(required = false) Member m, HttpSession session) {
		int result = service.deleteMember(m.getMemberId());
		if(result > 0) {
			return "redirect:/logout.kh";
		}else {
			request.setAttribute("title", "회원탈퇴 실패");
			request.setAttribute("msg", "관리자에게 문의바랍니다.");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/");
		return "common/msg";
	}
	@RequestMapping(value="/updateMemberFrm.kh")
	public String updateMemberFrm() {
		return "member/updateMemberFrm";
	}
	@ResponseBody
	@RequestMapping(value="/updateMember.kh")
	public String updateMember(Member m, HttpSession session) {
		int result = service.memberUpdate(m);
		Member member = service.selectOneMember(m);
		if(result > 0 && member != null ) {
			session.setAttribute("m", member);
			return "0";
		}else {
			return "1";
		}
	}
	@RequestMapping(value="/admin.kh")
	public String admin() {
		return "admin/manageMember";
	}
	@RequestMapping(value="/selectMemberList.kh")
	public String searchMemberList(int reqPage, Model model, int memberLevel) {
		MemberPageData mpd = service.selectMemberList(reqPage,memberLevel);
		model.addAttribute("memberList",mpd.getMemberList());
		model.addAttribute("pageNavi",mpd.getPageNavi());
		model.addAttribute("reqPage",reqPage);
		return "admin/memberList";
	}
	@RequestMapping(value="/selectBizList.kh")
	public String searchBizList(int reqPage, Model model, int memberLevel) {
		MemberPageData mpd = service.selectMemberList(reqPage,memberLevel);
		model.addAttribute("memberList",mpd.getMemberList());
		model.addAttribute("pageNavi",mpd.getPageNavi());
		model.addAttribute("reqPage",reqPage);
		return "admin/bizList";
	}
	@ResponseBody
	@RequestMapping(value="/sendMail.kh")
	public String sendMail(String email) {
		String code = null;
		Member m = new Member();
		m.setMemberId(email);
		Member member = service.selectOneMember(m);
		if(member == null) {
			code = new MailSender().sendMail(email);
		}
		return code;
	}
}
