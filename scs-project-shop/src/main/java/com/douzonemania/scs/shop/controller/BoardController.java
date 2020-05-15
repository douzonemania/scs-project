package com.douzonemania.scs.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board")
public class BoardController {

	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq() {
		return "board/faq";
	}
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qna() {
		return "board/qna";
	}
	
}
