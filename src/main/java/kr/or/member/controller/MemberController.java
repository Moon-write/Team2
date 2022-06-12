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
	@ResponseBody
	@RequestMapping(value="/selectOneMember.kh")
	public String selectOneMember(Member m) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			return "0";
		}else {
			return "1";
		}
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
		//insert 성공하면 0 실패하면 1 리턴
		if((m.getMemberLevel() == 2 && result == 0) || (m.getMemberLevel() == 1 && result == 0)) {
			request.setAttribute("title", "회원가입 성공");
			request.setAttribute("msg", "환영합니다.");
			request.setAttribute("icon", "success");
		}else if((m.getMemberLevel() == 2 && result == 1) || (m.getMemberLevel() == 1 && result == 1)) {
			request.setAttribute("title", "회원가입 실패");
			request.setAttribute("msg", "다시 시도하세요.");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/");
		return "common/msg";
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
		int result = service.changePw(m, memberPwNew);
		if(result > 0){
			request.setAttribute("title", "비밀번호 변경성공");
			request.setAttribute("msg", "비밀번호가 성공적으로 변경되었습니다.");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "비밀번호 변경실패");
			request.setAttribute("msg", "비밀번호 변경에 실패했습니다.");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/");
		return "common/msg";
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
	@RequestMapping(value="deleteMemberFrm.kh")
	public String deleteMemberFrm() {
		return "member/deleteMemberFrm";
	}
	@RequestMapping(value="deleteMember.kh")
	public String deleteMember(@SessionAttribute(required = false) Member m, HttpSession session) {
		String memberId = m.getMemberId();
		int result = service.deleteMember(memberId);
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
	@RequestMapping(value="/selectMemberList.kh")
	public String selectMemberList(int reqPage, Model model) {
		MemberPageData mpd = service.selectMemberList(reqPage);
		model.addAttribute("memberList",mpd.getMemberList());
		model.addAttribute("pageNavi",mpd.getPageNavi());
		model.addAttribute("reqPage",reqPage);
		return "admin/memberList";
	}
	@RequestMapping(value="/searchMemberList.kh")
	public String searchMemberList(int reqPage, Model model, String keyword) {
		MemberPageData mpd = service.searchMemberList(reqPage, keyword);
		model.addAttribute("memberList",mpd.getMemberList());
		model.addAttribute("pageNavi",mpd.getPageNavi());
		model.addAttribute("reqPage",reqPage);
		return "admin/memberList";
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
	@RequestMapping(value = "/deleteMemberList.kh")
	public String deleteMemberList(String memberIdArr) {
		boolean result = service.deleteMemberList(memberIdArr);
		if(result) {
			request.setAttribute("title", "성공");
			request.setAttribute("msg", "요청이 처리되었습니다.");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "실패");
			request.setAttribute("msg", "요청 처리 중 에러가 발생했습니다.");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/selectMemberList.kh?reqPage=1&memberLevel=2");
		return "common/msg";
	}
	@ResponseBody
	@RequestMapping(value="/delCount.kh")
	public String delCount(int memberNo) {
		int result = service.delCount(memberNo);
		if(result > 0) {
			return "-1";
		}else {
			return "0";
		}
	}
}
