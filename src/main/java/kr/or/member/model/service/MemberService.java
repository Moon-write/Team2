package kr.or.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	
	//암호화 AOP 넣을 메소드들 *Member로 끝나고 매개변수 Member타입이여야함
	public Member selectOneMember(Member m) {
		return dao.selectOneMember(m);
	}

	public int insertMember(Member m) {
		return dao.insertMember(m);
	}

}
