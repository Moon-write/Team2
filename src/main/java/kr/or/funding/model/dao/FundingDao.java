package kr.or.funding.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.board.model.vo.Board;
import kr.or.common.model.vo.Comment;
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

	public ArrayList<FundingJoinFile> selectAllList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("funding.selectAllList",map);
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

	public Funding selecOneFundingMemberNo(Funding funding) {		
		return sqlSession.selectOne("funding.selectOneFundingMemberNo",funding);
	}

	public int updateFunding(Funding f) {
		return  sqlSession.update("funding.updateFunding", f);
	}


	public ArrayList<Integer> selectFundingOptionPriceNo(Funding f) {
		List list = sqlSession.selectList("funding.selectFundingOptionPriceNo",f);
		return (ArrayList<Integer>)list;
	}

	public int updateFundingOptionPrice(HashMap<String, Object> map) {
		return  sqlSession.update("funding.updateFundingOptionPrice", map);
	}
	public ArrayList<Integer> selectFundingFileNo(Funding f) {
		List list = sqlSession.selectList("funding.selectFundingFileNo",f);
		return (ArrayList<Integer>)list;
	}
	
	public int updateFundingFile(FundingFile file) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteFundingFile(HashMap<String, Object> map) {
		return sqlSession.delete("funding.deleteFundingFile",map);
	}

	public int addLike(HashMap<String, Object> map) {
		
		return sqlSession.insert("funding.addLike",map);
	}

	public int removeLike(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.delete("funding.removeLike",map);
	}
	
	public int getTotalLike(int fundingNo) {
		int result = sqlSession.selectOne("funding.getTotalLike", fundingNo);
		System.out.println("토탈 개수  : "+ result);
		return result;
	}

	public Funding selectOneFundingRight(int fundingNo) {
		return sqlSession.selectOne("funding.selectOneFundingRight",fundingNo);
	}

	public int addComment(Comment c) {
		// TODO Auto-generated method stub
		return sqlSession.insert("funding.addComment", c);
	}

	public Comment selectLastComment(Comment c) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("funding.selectLastComment",c);
	}
	


}
