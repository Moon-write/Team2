package kr.or.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.group.model.service.GroupService;

@Controller
public class GroupController {
	@Autowired
	private GroupService service;
	
	@RequestMapping(value="/groupList.kh")
	public String groupList() {
		return "group/groupMain";
	}
}
