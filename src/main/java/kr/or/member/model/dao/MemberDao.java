package kr.or.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member selectOneMember(Member m) {
		Member member = sqlSession.selectOne("member.selectOneMember",m);
		return member;
	}
	public Member selectOneMemberId(String memberId) {
		Member member = sqlSession.selectOne("member.selectOneMemberId",memberId);
		return member;
	}
	public int insertMember(Member m) {
		int result = sqlSession.insert("member.insertMember",m);
		return result;
	}
	public int newPwMember(Member m) {
		return sqlSession.update("member.newPw",m);
	}
	public int deleteMember(int memberNo) {
		return sqlSession.delete("member.deleteMember",memberNo);
	}
	public int memberUpdate(Member m) {
		return sqlSession.update("member.updateMember",m);
	}
	public ArrayList<Member> selectMemberList(HashMap<String, Object> map) {
		List<Member> memberList = sqlSession.selectList("member.selectMemberList",map);
		return (ArrayList<Member>)memberList;
	}
	public int selectMemberCount(HashMap<String, Object> memberMap) {
		int totalMemberCount = sqlSession.selectOne("member.selectMemberCount",memberMap);
		return totalMemberCount;
	}
	

	

}
