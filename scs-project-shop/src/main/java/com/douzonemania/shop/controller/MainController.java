package com.douzonemania.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzonemania.shop.service.MainService;
import com.douzonemania.shop.vo.MemberVo;

@Controller
@RequestMapping("/{db}")
public class MainController {
	
	@RequestMapping({"","/main"})
	public String home() {
		System.out.println("MAIN");
		return "main/index";
	}
	
}
