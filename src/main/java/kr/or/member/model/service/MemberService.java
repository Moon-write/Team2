package kr.or.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.common.SHA256Enc;
import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	@Autowired
	private SHA256Enc enc;
	
	//암호화 AOP 넣을 메소드들 *Member로 끝나고 매개변수 Member타입이여야함
	public Member selectOneMember(Member m) {
		return dao.selectOneMember(m);
	}
	public int insertMember(Member m) {
		return dao.insertMember(m);
	}
	public int changePw(Member m, String memberPwNew) {
		try {
			String oldPwEnc = enc.endData(m.getMemberPw());
			m.setMemberPw(oldPwEnc);//기존 비밀번호 암호화
			memberPwNew = enc.endData(memberPwNew);//새 비밀번호 암호화
		} catch (Exception e) {
			e.printStackTrace();
		}
		Member member = dao.selectOneMember(m);
		if(member == null) {
			return -1;
		}
		m.setMemberPw(memberPwNew);
		int result = dao.newPwMember(m);
		return result;
	}

	public int deleteMember(int memberNo) {
		return dao.deleteMember(memberNo);
	}

	public int memberUpdate(Member m) {
		return dao.memberUpdate(m);
	}
	public MemberPageData selectMemberList(int reqPage) {
		ArrayList<Member> memberList = dao.selectMemberList(reqPage);
		return null;
	}

	



}
