package com.douzonemania.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/{db}")
public class MainController {
	
	@RequestMapping({"","/main"})
	public String home() {
		return "main/index";
	}
	
}