package kr.or.business.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.auction.model.vo.Auction;
import kr.or.auction.model.vo.Bid;
import kr.or.business.model.service.BusinessService;
import kr.or.business.model.vo.View;
import kr.or.common.model.vo.Order;
import kr.or.donation.model.vo.Donation;
import kr.or.funding.model.vo.Funding;
import kr.or.group.model.vo.Group;
import kr.or.shop.model.vo.Shop;

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
	
	//관리페이지
	@RequestMapping(value="/manageFunding.kh")
	public String manageFunding() {		
		return "business/manageFunding";
	}
	@RequestMapping(value="/manageDonation.kh")
	public String manageDonation() {		
		return "business/manageDonation";
	}
	@RequestMapping(value="/manageGroup.kh")
	public String manageGroup() {
		return "business/manageGroup";
	}
	@RequestMapping(value="/manageAuction.kh")
	public String manageAuction() {
		return "business/manageAuction";
	}
	
	
	
	
	
	
	
	
	//삭제
	@ResponseBody
	@RequestMapping(value="/deleteAuction.kh")
	public String deleteAuction(int projectNo) {
		int result=service.deleteAuction(projectNo);
		return "/manageAuction.kh";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkDnOrder.kh")
	public int checkDnOrder(int projectNo) {
		int cdo=service.checkDnOrder(projectNo);
		return cdo;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteDonation.kh")
	public String deleteDonation(int projectNo) {
		int result=service.deleteDonation(projectNo);
		return "/manageDonation.kh";
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteFunding.kh")
	public String deleteFunding(int fundingNo) {
		int result=service.deleteFunding(fundingNo);
		return "/manageFunding.kh";
	}
	
	
	
	
	
	
	
	
	//조회수
	@RequestMapping(value="/checkCount.kh")
	public String checkCount() {	
		return "business/checkCount";
	}
	
	
	
	
	
	
	//관리 ajax
	@ResponseBody
	@RequestMapping(value="/selectAList.kh",produces="application/json;charset=utf-8")
	public String selectAList(int memberNo) {
		ArrayList<String> al=service.selectAList(memberNo);
		return new Gson().toJson(al);
	}
	@ResponseBody
	@RequestMapping(value="/selectExpiredAList.kh",produces="application/json;charset=utf-8")
	public String selectExpiredAList(int memberNo) {
		ArrayList<String> al=service.selectExpiredAList(memberNo);
		return new Gson().toJson(al);
	}
	@ResponseBody
	@RequestMapping(value="/selectBestPrice.kh",produces="application/json;charset=utf-8")
	public String selectBestPrice(int memberNo, int projectNo) {
		String a=service.selectBestPrice(memberNo, projectNo);
		return new Gson().toJson(a);
	}
	
	@ResponseBody
	@RequestMapping(value="/selectDList.kh",produces="application/json;charset=utf-8")
	public String selectDList(int memberNo) {
		ArrayList<String> dl=service.selectDList(memberNo);
		return new Gson().toJson(dl);
	}
	
	@ResponseBody
	@RequestMapping(value="/selectExpiredDList.kh",produces="application/json;charset=utf-8")
	public String selectExpiredDList(int memberNo) {
		ArrayList<String> dl=service.selectExpiredDList(memberNo);
		return new Gson().toJson(dl);
	}
	
	@ResponseBody
	@RequestMapping(value="/selectFList.kh",produces="application/json;charset=utf-8")
	public String selectFList(int memberNo) {
		ArrayList<String> fl=service.selectFList(memberNo);
		return new Gson().toJson(fl);
	}
	
	@ResponseBody
	@RequestMapping(value="/selectExpiredFList.kh",produces="application/json;charset=utf-8")
	public String selectExpiredFList(int memberNo) {
		ArrayList<String> fl=service.selectExpiredFList(memberNo);
		return new Gson().toJson(fl);
	}
	
	@ResponseBody
	@RequestMapping(value="/auctionCount.kh",produces="application/json;charset=utf-8")
	public String auctionCount(int memberNo) {
		ArrayList<String> ac=service.selectAcList(memberNo);
		return new Gson().toJson(ac);
	}
	@ResponseBody
	@RequestMapping(value="/donationCount.kh",produces="application/json;charset=utf-8")
	public String donationCount(int memberNo) {
		ArrayList<String> ac=service.selectDcList(memberNo);
		return new Gson().toJson(ac);
	}
	@ResponseBody
	@RequestMapping(value="/fundingCount.kh",produces="application/json;charset=utf-8")
	public String fundingCount(int memberNo) {
		ArrayList<String> ac=service.selectFcList(memberNo);
		return new Gson().toJson(ac);
	}
	@ResponseBody
	@RequestMapping(value="/groupCount.kh",produces="application/json;charset=utf-8")
	public String groupCount(int memberNo) {
		ArrayList<String> ac=service.selectGcList(memberNo);
		return new Gson().toJson(ac);
	}
}
