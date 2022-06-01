package kr.or.business.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.auction.model.vo.Auction;
import kr.or.business.model.vo.View;
import kr.or.common.model.vo.Order;
import kr.or.donation.model.vo.Donation;
import kr.or.funding.model.vo.Funding;
import kr.or.group.model.vo.Group;
import kr.or.shop.model.vo.Shop;

@Repository
public class BusinessDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Funding> selectFdList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectFdList", memberNo);
		return (ArrayList<Funding>) list;
	}

	public ArrayList<Funding> selectExpiredFdList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectExpiredFdList", memberNo);
		return (ArrayList<Funding>) list;
	}
	
	public ArrayList<String> selectDList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectDList", memberNo);
		return (ArrayList<String>) list;
	}

	public ArrayList<String> selectExpiredDList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectExpiredDList", memberNo);
		return (ArrayList<String>) list;
	}
	
	public ArrayList<Group> selectGrList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectGrList", memberNo);
		return (ArrayList<Group>) list;
	}

	public ArrayList<Auction> selectAucList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectAucList", memberNo);
		return (ArrayList<Auction>) list;
	}

	public String selectBestPrice(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("business.selectBestPrice", map);
	}

	public ArrayList<Auction> selectExpiredAucList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectExpiredAucList", memberNo);
		return (ArrayList<Auction>) list;
	}

	public int deleteAuction(int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("business.deleteAuction",projectNo);
	}

	public int checkDnOrder(int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("business.checkDnOrder",projectNo);
	}

	public int deleteDonation(int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("business.deleteDonation",projectNo);
	}

	public ArrayList<String> selectAcList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectAcList", memberNo);
		return (ArrayList<String>) list;
	}
	public ArrayList<String> selectDcList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectDcList", memberNo);
		return (ArrayList<String>) list;
	}
	public ArrayList<String> selectFcList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectFcList", memberNo);
		return (ArrayList<String>) list;
	}
	public ArrayList<String> selectGcList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectGcList", memberNo);
		return (ArrayList<String>) list;
	}

	public Shop selectShopNo(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("business.selectShopNo",memberNo);
	}

	public ArrayList<String> selectAList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectAList", memberNo);
		return (ArrayList<String>) list;	
	}

	public ArrayList<String> selectExpiredAList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectExpiredAList", memberNo);
		return (ArrayList<String>) list;
	}

	public int deleteFunding(int fundingNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("business.deleteFunding",fundingNo);
	}

	public ArrayList<String> selectFList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectFList", memberNo);
		return (ArrayList<String>) list;	
	}

	public ArrayList<String> selectExpiredFList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectExpiredFList", memberNo);
		return (ArrayList<String>) list;
	}

	public ArrayList<String> selectGList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectGList", memberNo);
		return (ArrayList<String>) list;
	}

	public ArrayList<String> selectExpiredGList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectExpiredGList", memberNo);
		return (ArrayList<String>) list;
	}

	public int deleteGroup(int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("business.deleteGroup",projectNo);
	}



	public ArrayList<String> selectBidList(int projectNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectBidList", projectNo);
		return (ArrayList<String>) list;
	}

	public List<Integer> auctionGender(int[] gens) {
		// TODO Auto-generated method stub		
		return sqlSession.selectList("business.auctionGender",gens);
	}

	public ArrayList<String> selectMemberNo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectMemberNo", map);
		return (ArrayList<String>) list;
	}

	public List<Integer> selectMaleGroup(int[] mns) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("business.selectMaleGroup",mns);
	}

	public List<Integer> selectFemaleGroup(int[] mns) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("business.selectFemaleGroup",mns);
	}

	public List<Integer> genderGraph(int[] mns) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("business.genderGraph",mns);
	}

	public ArrayList<String> selectOrderList(int memberNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectOrderList",memberNo);
		return (ArrayList<String>) list;
	}

	public int orderCancel(int orderNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("business.orderCancel",orderNo);
	}

	public ArrayList<String> searchDelivery(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.searchDelivery", map);
		return (ArrayList<String>) list;
	}

	public ArrayList<String> selectOrderProduct(int orderNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.selectOrderProduct",orderNo);
		return (ArrayList<String>) list;
	}

	public int deliveryComplete(int orderNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("business.deliveryComplete",orderNo);
	}

	public int insertDelivery(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("business.insertDelivery",map);
	}

	public int deleteDelivery(long invoiceNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("business.deleteDelivery",invoiceNo);
	}

	public ArrayList<String> getDates(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.getDates",map);
		return (ArrayList<String>) list;
	}
	
	public ArrayList<String> getAmounts(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("business.getAmounts",map);
		return (ArrayList<String>) list;
	}

	public String selectStartDate(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("business.selectStartDate",memberNo);
	}
}
