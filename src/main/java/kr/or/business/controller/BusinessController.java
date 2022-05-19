package kr.or.business.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.auction.model.vo.Auction;
import kr.or.auction.model.vo.Bid;
import kr.or.business.model.service.BusinessService;
import kr.or.donation.model.vo.Donation;
import kr.or.funding.model.vo.Funding;
import kr.or.group.model.vo.Group;

@Controller

public class BusinessController {
	@Autowired
	private BusinessService service;
	
	@RequestMapping(value="/business.kh")
	public String business() {
		return "business/business";
	}
	
	@RequestMapping(value="/sumChart.kh")
	public String sumChart(int memberNo, Model model) {
		return "business/sumChart";
	}
	@RequestMapping(value="/manageFunding.kh")
	public String manageFunding(int memberNo, Model model) {
		ArrayList<Funding> fd=service.selectFdList(memberNo);
		return "business/manageFunding";
	}
	@RequestMapping(value="/manageDonation.kh")
	public String manageDonation(int memberNo, Model model) {
		ArrayList<Donation> dn=service.selectDnList(memberNo);
		return "business/manageDonation";
	}
	@RequestMapping(value="/manageGroup.kh")
	public String manageGroup(int memberNo, Model model) {
		ArrayList<Group> gr=service.selectGrList(memberNo);
		return "business/manageGroup";
	}
	@RequestMapping(value="/manageAuction.kh")
	public String manageAuction(int memberNo, Model model) {
		ArrayList<Auction> au=service.selectAucList(memberNo);
		ArrayList<Auction> expiredAu=service.selectExpiredAucList(memberNo);
		model.addAttribute("au",au);
		model.addAttribute("expiredAu",expiredAu);
		return "business/manageAuction";
	}
	
	/*@RequestMapping(value="/checkCount.kh")
	public String checkCount(int memberNo, Model model) {
		Donation dn=service.checkDoCount(memberNo);
		Auction au=service.checkAucCount(memberNo);
		Group gr=service.checkGrCount(memberNo);
		Funding fd=service.checkFdCount(memberNo);
		return "business/checkCount";
	}*/
}
