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
		}	
		return "redirect:/";
	}
	@RequestMapping(value="/logout.kh")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping(value="/selectOneMember.kh")
	public String searchOneMember(Member m,Model model) {
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
	public String idCheck(Member m) { 
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
		if(member != null) {
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
	public String deleteMember(@SessionAttribute(required = false) Member m, HttpServletRequest request) {
		int result = service.deleteMember(m.getMemberNo());
		if(result == 1) {
			request.setAttribute("title", "회원탈퇴완료");
			request.setAttribute("msg", "성공적으로 탈퇴했습니다.");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "회원탈퇴실패");
			request.setAttribute("msg", "탈퇴에 실패했습니다.");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/");
		session.invalidate();
		return "common/msg";
	}
	@RequestMapping(value="/updateMemberFrm.kh")
	public String updateMemberFrm() {
		return "member/updateMemberFrm";
	}
	@RequestMapping(value="/updateMember.kh")
	public String updateMember(Member m, HttpServletRequest request, HttpSession session) {
		int result = service.memberUpdate(m);
		if(result == 1) {
			session.setAttribute("m", m);
			request.setAttribute("title", "정보수정완료");
			request.setAttribute("msg", "회원정보가 수정되었습니다.");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "정보수정실패");
			request.setAttribute("msg", "정보수정에 실패했습니다.");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/");
		return "common/msg";
	}
	@RequestMapping(value="/admin.kh")
	public String admin() {
		return "admin/manageMember";
	}
	@RequestMapping(value="/memberList.kh")
	public String memberList(int reqPage, Model model) {
		MemberPageData mpd = service.selectMemberList(reqPage);
		model.addAttribute("memberList",mpd.getMemberList());
		model.addAttribute("pageNavi",mpd.getPageNavi());
		model.addAttribute("reqPage",reqPage);
		return "board/memberList";
	}
	@RequestMapping(value="/searchMemberList.kh")
	public String searchMemberList(int reqPage, Model model) {
		MemberPageData mpd = service.selectMemberList(reqPage);
		model.addAttribute("memberList",mpd.getMemberList());
		model.addAttribute("pageNavi",mpd.getPageNavi());
		model.addAttribute("reqPage",reqPage);
		return "board/memberList";
	}
	
}
