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
	public int insertMember(Member m) {
		int result = sqlSession.insert("member.insertMember",m);
		return result;
	}
	public int insertShop(Member m) {
		return sqlSession.insert("member.insertShop",m);
	}
	public int newPwMember(Member m) {
		return sqlSession.update("member.newPw",m);
	}
	public int deleteMember(String memberId) {
		return sqlSession.delete("member.deleteMember",memberId);
	}
	public int memberUpdate(Member m) {
		return sqlSession.update("member.memberUpdate",m);
	}
	public ArrayList<Member> selectMemberList(HashMap<String, Object> map) {
		List memberList = sqlSession.selectList("member.selectMemberList",map);
		return (ArrayList<Member>)memberList;
	}
	public int selectMemberCount(HashMap<String, Object> memberMap) {
		int totalMemberCount = sqlSession.selectOne("member.selectMemberCount",memberMap);
		return totalMemberCount;
	}
	

	

}
