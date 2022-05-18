package kr.or.auction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.auction.model.service.AuctionService;

@Controller
public class AuctionController {

	@Autowired
	private AuctionService service;
	
}
