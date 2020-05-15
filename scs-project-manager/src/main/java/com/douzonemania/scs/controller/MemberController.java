package com.douzonemania.scs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member")
public class MemberController {

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String memberBoard() {
		return "member/board";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String memberList() {
		return "member/list";
	}
	@RequestMapping(value = "/send-mail", method = RequestMethod.GET)
	public String sendMail() {
		return "member/send-mail";
	}
}
