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
import kr.or.funding.model.vo.FundingJoinFile;
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

	public ArrayList<FundingJoinFile> selectAllList() {
		List list = sqlSession.selectList("funding.selectAllList");
		return (ArrayList<FundingJoinFile>)list;
	}
	

	public Funding selectOneFunding(int fundingNo) {
		
		return sqlSession.selectOne("funding.selectOneFunding",fundingNo);
	}
	
	public ArrayList<FundingFile> selectOneFundingFile(int fundingNo) {
		List list = sqlSession.selectList("funding.selectOneFundingFile",fundingNo);
		return (ArrayList<FundingFile>)list ;
	}

	public ArrayList<FundingOptionPrice> selectFundingOptionPrice(int fundingNo) {
		List list = sqlSession.selectList("funding.selectFundingOptionPrice",fundingNo);
		return (ArrayList<FundingOptionPrice>) list;
	}

	public Funding selectOneFunding2(int fundingNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("funding.selectOneFunding2",fundingNo);
	}


}
