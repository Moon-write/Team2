package kr.or.funding.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.board.model.vo.Board;
import kr.or.common.model.vo.Comment;
import kr.or.common.model.vo.Order;
import kr.or.funding.model.vo.Funding;
import kr.or.funding.model.vo.FundingBoard;
import kr.or.funding.model.vo.FundingFile;
import kr.or.funding.model.vo.FundingJoinFile;
import kr.or.funding.model.vo.FundingOptionPrice;
import kr.or.member.model.vo.Member;

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
	
	public ArrayList<FundingJoinFile> selectListTeck(HashMap<String, Object> map) {
		List list = sqlSession.selectList("funding.selectListTeck",map);
		return  (ArrayList<FundingJoinFile>)list;
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

	public int checkViewCount(int fundingNo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("funding.checkViewCount", fundingNo);
	}
	/*
	public int insertOrderPay(Order o) {
		return sqlSession.insert("funding.insertOrderPay", o);
	}
	
*/

	public int insertOrder(Order o) {
		System.out.println("아니 왜 펀딩이름이 200자가 드렁가지 : " +o.getProjectName());
		return sqlSession.insert("funding.insertOrder",o);
	}

	public int selectOrederMaxNo() {
		int OrderMaxNo = sqlSession.selectOne("funding.selectOrderMaxNo");
		System.out.println("OrderMaxNo : "+OrderMaxNo);
		return OrderMaxNo;
	}

	public int insertOrderProduct(HashMap<String, Object> map) {
		return sqlSession.insert("funding.insertOrderProduct",map);
	}

	public Funding selectFundingCurrentSum(Order o) {
		return sqlSession.selectOne("funding.selectFundingCurrentSum",o);
	}

	public int updateFundingCurrentSum(Funding funding) {
	    return sqlSession.update("funding.updateFundingCurrentSum",funding);
		
	}
	public ArrayList<FundingBoard> selectFundingBoard(int fundingNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("funding.selectFundingBoard", fundingNo);
		return (ArrayList<FundingBoard>)list;
	}

	//카테고리 리스트 불러오기
	public ArrayList<FundingJoinFile> selectFundingListCategory(HashMap<String, Object> map) {
		List list = sqlSession.selectList("funding.selectFundingListCategory",map);
		return (ArrayList<FundingJoinFile>)list;
	}

	public FundingBoard selectOneFundingBoard(int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("funding.selectOneFundingBoard",boardNo);
	}


	

}
