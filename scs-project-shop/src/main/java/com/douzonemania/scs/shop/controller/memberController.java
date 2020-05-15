package com.douzonemania.scs.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member")
public class memberController {

	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String find() {
		return "member/find";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage() {
		return "member/mypage";
	}
}
