package kr.or.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/loginFrm.kh")
	public String loginFrm() {
		return "member/loginFrm";
	}
	
	@RequestMapping(value="/login.kh")
	public String login(Member m, HttpSession session) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			System.out.println("멤버 아이디 : " +member.getMemberId());
			System.out.println("멤버 비밀번호 : " +member.getMemberPw());
			session.setAttribute("m", member);
		}
		System.out.println("멤버 객체 못가져옴");
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout.kh")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
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
	
	@RequestMapping(value="/joinBiz.kh")
	public String joinFrmMe(Member m) {
		int result = service.insertMember(m);
		return "member/joinBiz";
	}
	
	@RequestMapping(value="/mypageMain.kh")
	public String mypageMain() {
		return "member/mypageMain";
	}
	
}
