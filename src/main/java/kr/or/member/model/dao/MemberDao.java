package kr.or.member.model.dao;

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

	public int newPwMember(Member m) {
		return sqlSession.update("member.newPw",m);
	}

	public int deleteMember(int memberNo) {
		return sqlSession.delete("member.deleteMember",memberNo);
	}

	public int updateMember(Member m) {
		return sqlSession.update("member.updateMember",m);
	}

}
