package kr.or.donation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.donation.model.service.DonationService;

@Controller
public class DonationController {
	@Autowired
	private DonationService service;
	
	@RequestMapping(value="/donationList.kh")
	public String dmMail() {
		return "donation/donationMain";
	}
}