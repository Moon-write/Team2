package kr.or.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.or.board.model.service.BoardService;
import kr.or.business.model.service.BusinessService;
import kr.or.common.model.service.commonService;

@Component
public class Schedule {
	@Autowired
	private commonService service;

	@Scheduled(cron = "0 0 0/1 * * *")
	public void deleteKeyword() {
		int result=service.deleteKeyword();
	}

}
