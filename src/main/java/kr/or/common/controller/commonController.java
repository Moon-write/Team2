package kr.or.common.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.common.model.service.commonService;
import kr.or.common.model.vo.Project;

@Controller
public class commonController {

	@Autowired
	private commonService service;
	
	@RequestMapping(value="/searchProject.kh")
	public String searchProject(String keyword, Model model) {
		
		ArrayList<Project> list = service.searchProject(keyword);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		return "common/searchResult";
	}
}
