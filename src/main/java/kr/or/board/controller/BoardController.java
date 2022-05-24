package kr.or.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import kr.or.board.model.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService service;
}
