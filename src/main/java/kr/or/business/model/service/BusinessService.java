package kr.or.business.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.auction.model.vo.Auction;
import kr.or.auction.model.vo.Bid;
import kr.or.business.model.dao.BusinessDao;
import kr.or.business.model.vo.View;
import kr.or.common.model.vo.Order;
import kr.or.donation.model.vo.Donation;
import kr.or.funding.model.vo.Funding;
import kr.or.group.model.vo.Group;
import kr.or.shop.model.vo.Shop;
import kr.or.shop.model.vo.ShopPic;
import oracle.net.aso.a;

@Service
public class BusinessService {
	@Autowired
	private BusinessDao dao;

	public Shop selectShopNo(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectShopNo(memberNo);
	}

	public ArrayList<Funding> selectFdList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectFdList(memberNo);
	}

	public ArrayList<Funding> selectExpiredFdList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectExpiredFdList(memberNo);
	}

	public ArrayList<String> selectDList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectDList(memberNo);
	}

	public ArrayList<String> selectExpiredDList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectExpiredDList(memberNo);
	}

	public ArrayList<Group> selectGrList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectGrList(memberNo);
	}

	/*
	 * public ArrayList<Auction> selectAucList(int memberNo) { // TODO
	 * Auto-generated method stub ArrayList<Auction> au =
	 * dao.selectAucList(memberNo); for (Auction bp : au) { HashMap<String, Object>
	 * map = new HashMap<String, Object>(); map.put("projectNo", bp.getProjectNo());
	 * map.put("memberNo", memberNo); Auction bestPrice = dao.selectBestPrice(map);
	 * bp.setBestPrice(bestPrice.getBestPrice()); } return au; }
	 */

	/*
	 * public ArrayList<Auction> selectExpiredAucList(int memberNo) { // TODO
	 * Auto-generated method stub ArrayList<Auction> au =
	 * dao.selectExpiredAucList(memberNo); for (Auction bp : au) { HashMap<String,
	 * Object> map = new HashMap<String, Object>(); map.put("projectNo",
	 * bp.getProjectNo()); map.put("memberNo", memberNo); Auction bestPrice =
	 * dao.selectBestPrice(map); bp.setBestPrice(bestPrice.getBestPrice()); } return
	 * au; }
	 */

	public int deleteAuction(int projectNo) {
		// TODO Auto-generated method stub
		return dao.deleteAuction(projectNo);
	}

	public int checkDnOrder(int projectNo) {
		// TODO Auto-generated method stub
		return dao.checkDnOrder(projectNo);
	}

	public int deleteDonation(int projectNo) {
		// TODO Auto-generated method stub
		return dao.deleteDonation(projectNo);
	}

	public ArrayList<String> selectAcList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectAcList(memberNo);
	}

	public ArrayList<String> selectDcList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectDcList(memberNo);
	}

	public ArrayList<String> selectFcList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectFcList(memberNo);
	}

	public ArrayList<String> selectGcList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectGcList(memberNo);
	}

	public ArrayList<String> selectAList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectAList(memberNo);
	}

	public ArrayList<String> selectExpiredAList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectExpiredAList(memberNo);
	}

	public String selectBestPrice(int memberNo, int projectNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("memberNo", memberNo);
		return dao.selectBestPrice(map);
	}

	public int deleteFunding(int fundingNo) {
		// TODO Auto-generated method stub
		return dao.deleteFunding(fundingNo);
	}

	public ArrayList<String> selectFList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectFList(memberNo);
	}

	public ArrayList<String> selectExpiredFList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectExpiredFList(memberNo);
	}

	public ArrayList<String> selectGList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectGList(memberNo);
	}

	public ArrayList<String> selectExpiredGList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectExpiredGList(memberNo);
	}

	public int deleteGroup(int projectNo) {
		// TODO Auto-generated method stub
		return dao.deleteGroup(projectNo);
	}

	public ArrayList<String> genderGraph(int memberNo, int projectNo, int divNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("memberNo", memberNo);
		map.put("divNo", divNo);
		return dao.genderGraph(map);
	}

	public ArrayList<String> selectBidList(int projectNo) {
		// TODO Auto-generated method stub
		return dao.selectBidList(projectNo);
	}

	public List<Integer> auctionGender(int[] gens) {
		// TODO Auto-generated method stubs2.add(memberNo);
		return dao.auctionGender(gens);
	}

}
