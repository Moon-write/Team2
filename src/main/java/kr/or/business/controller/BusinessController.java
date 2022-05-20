package kr.or.business.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.auction.model.vo.Auction;
import kr.or.auction.model.vo.Bid;
import kr.or.business.model.service.BusinessService;
import kr.or.common.model.vo.Order;
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
		ArrayList<Donation> d=service.selectDnList(memberNo);
		ArrayList<Donation> expiredD=service.selectExpiredDnList(memberNo);
		model.addAttribute("d",d);
		model.addAttribute("expiredD",expiredD);
		return "business/manageDonation";
	}
	@RequestMapping(value="/manageGroup.kh")
	public String manageGroup(int memberNo, Model model) {
		ArrayList<Group> gr=service.selectGrList(memberNo);
		model.addAttribute("gr",gr);
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
	
	@RequestMapping(value="/deleteAuction.kh")
	public String deleteAuction(int projectNo) {
		int result=service.deleteAuction(projectNo);
		return "business/business";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkDnOrder.kh")
	public int checkDnOrder(int projectNo) {
		int cdo=service.checkDnOrder(projectNo);
		return cdo;
	}
	
	@RequestMapping(value="/deleteDonation.kh")
	public String deleteDonation(int projectNo) {
		int result=service.deleteDonation(projectNo);
		return "business/business";
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
