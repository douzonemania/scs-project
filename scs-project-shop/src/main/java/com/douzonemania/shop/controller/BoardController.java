package com.douzonemania.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzonemania.shop.repository.BoardRepository;


@Controller
@RequestMapping("/{db}/board")
public class BoardController {

	@Autowired
	BoardRepository boardRepository;
	
	@RequestMapping(value = "/faq")
	public String faq() {
		boardRepository.getSession();
		return "board/faq";
	}
	@RequestMapping(value = "/qna")
	public String qnaWrite() {
		return "board/qna";
	}
	
	@RequestMapping(value = "/qna/list")
	public String qnaList() {
		return "board/qna";
	}
	
}
