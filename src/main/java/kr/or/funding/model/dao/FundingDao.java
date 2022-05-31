package kr.or.funding.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.board.model.vo.Board;
import kr.or.funding.model.vo.Funding;
import kr.or.funding.model.vo.FundingFile;
import kr.or.funding.model.vo.FundingOptionPrice;

@Repository
public class FundingDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertFunding(Funding f) {
		int result1 =  sqlSession.insert("funding.insertFunding", f);
		return result1;
	}

	public int selectFundingMaxNo() {
		int fundingMaxNo = sqlSession.selectOne("funding.selectFundingMaxNo");
		System.out.println("fundingMaxNo : "+fundingMaxNo);
		return fundingMaxNo;
	}

	public int insertFundingOptionPrice(HashMap<String, Object> map) {
		return sqlSession.insert("funding.insertFundingOptionPrice",map);
	}

	public int insertFundingFile(FundingFile file) {
		return sqlSession.insert("funding.insertFundingFile",file);
	}

	public ArrayList<Funding> selectAllList() {
		List list = sqlSession.selectList("funding.selectAllList");
		return (ArrayList<Funding>)list;
	}

}
