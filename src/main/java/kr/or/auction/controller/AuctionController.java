package kr.or.auction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.auction.model.service.AuctionService;

@Controller
public class AuctionController {

	@Autowired
	private AuctionService service;
	
	@RequestMapping(value="auctionList.kh")
	public String auctionList() {
		// 진행중인 경매리스트 불러오기 + 페이지순
		return "auction/auctionList";
	}
	
	@RequestMapping(value="addAuction.kh")
	public String addAuction() {
		return "auction/addAuction";
	}
}
