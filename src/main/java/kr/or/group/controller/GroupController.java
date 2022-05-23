package kr.or.group.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.group.model.service.GroupService;

@Controller
public class GroupController {
	@Autowired
	private GroupService service;
	
	//메인
	@RequestMapping(value="/groupList.kh")
	public String groupList() {
		return "group/groupMain";
	}
	
	//다섯 카테고리
	@RequestMapping(value="/groupTech.kh")
	public String groupTech() {
		return "group/groupTech";
	}
	@RequestMapping(value="/groupFashion.kh")
	public String groupFashion() {
		return "group/groupFashion";
	}
	@RequestMapping(value="/groupLiving.kh")
	public String groupLiving() {
		return "group/groupLiving";
	}
	@RequestMapping(value="/groupFood.kh")
	public String groupFood() {
		return "group/groupFood";
	}
	@RequestMapping(value="/groupBeauty.kh")
	public String groupBeauty() {
		return "group/groupBeauty";
	}
	
	//상세페이지
	@RequestMapping(value="/groupView.kh")
	public String groupView() {
		return "group/groupView";
	}
	
	//공동구매 등록
	@RequestMapping(value="/groupAdd.kh")
	public String groupAdd() {
		return "group/groupAdd";
	}
}
