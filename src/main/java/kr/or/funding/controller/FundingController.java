package kr.or.funding.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.funding.model.service.FundingService;

@Controller
public class FundingController {
	@Autowired
	private FundingService service;
	
	@RequestMapping(value="/fundingInsert.kh")
	public String FundingInput(){
		return "funding/fundingInsertFrm";
	}
	@RequestMapping(value="/fundingList.kh")
	public String FundingList() {
		return "funding/fundingList";
	}
}
