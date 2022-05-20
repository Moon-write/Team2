package kr.or.business.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.auction.model.vo.Auction;
import kr.or.auction.model.vo.Bid;
import kr.or.business.model.dao.BusinessDao;
import kr.or.donation.model.vo.Donation;
import kr.or.funding.model.vo.Funding;
import kr.or.group.model.vo.Group;
import oracle.net.aso.a;

@Service
public class BusinessService {
	@Autowired
	private BusinessDao dao;

	public ArrayList<Funding> selectFdList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectFdList(memberNo);
	}

	public ArrayList<Donation> selectDnList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectDnList(memberNo);
	}

	public ArrayList<Donation> selectExpiredDnList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectExpiredDnList(memberNo);
	}

	public ArrayList<Group> selectGrList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectGrList(memberNo);
	}

	public ArrayList<Auction> selectAucList(int memberNo) {
		// TODO Auto-generated method stub
		ArrayList<Auction> au = dao.selectAucList(memberNo);
		for (Auction bp : au) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("projectNo", bp.getProjectNo());
			map.put("memberNo", memberNo);
			Auction bestPrice = dao.selectBestPrice(map);
			bp.setBestPrice(bestPrice.getBestPrice());
		}
		return au;
	}

	public ArrayList<Auction> selectExpiredAucList(int memberNo) {
		// TODO Auto-generated method stub
		ArrayList<Auction> au = dao.selectExpiredAucList(memberNo);
		for (Auction bp : au) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("projectNo", bp.getProjectNo());
			map.put("memberNo", memberNo);
			Auction bestPrice = dao.selectBestPrice(map);
			bp.setBestPrice(bestPrice.getBestPrice());
		}
		return au;
	}

}
