package kr.or.donation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.donation.service.DonationService;

@Controller
public class DonationController {
	@Autowired
	private DonationService service;
}
