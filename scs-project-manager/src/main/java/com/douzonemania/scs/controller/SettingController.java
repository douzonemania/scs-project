package com.douzonemania.scs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/setting")
public class SettingController {

	@RequestMapping(value = "/basic", method = RequestMethod.GET)
	public String info() {
		return "setting/basic";
	}

	@RequestMapping(value = "/policy", method = RequestMethod.GET)
	public String reg() {
		return "setting/policy";
	}
}
