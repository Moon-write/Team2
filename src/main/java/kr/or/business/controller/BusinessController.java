package kr.or.business.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.business.model.service.BusinessService;

@Controller

public class BusinessController {
	@Autowired
	private BusinessService service;
	
	@RequestMapping(value="/business.kh")
	public String business() {
		return "business/business";
	}
}
