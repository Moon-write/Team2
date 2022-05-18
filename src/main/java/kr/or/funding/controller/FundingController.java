package kr.or.funding.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.funding.model.service.FundingService;

@Controller
public class FundingController {
	@Autowired
	private FundingService service;
}
