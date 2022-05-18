package kr.or.iei.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.iei.model.service.FundingService;

@Controller
public class FundingController {
	@Autowired
	private FundingService service;
}
