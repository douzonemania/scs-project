package com.douzonemania.scs.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzonemania.scs.shop.service.MainService;
import com.douzonemania.scs.vo.MemberVo;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping({"","/main"})
	public String home() {
//		CeoVo vo = new CeoVo();
//		vo = mainService.getList();
//		System.out.println(vo);
		MemberVo vo = new MemberVo();
		vo = mainService.getList();
		System.out.println(vo);
		return "main/index";
	}
	
	@RequestMapping("/cart")
	public String home2() {
		return "order/cart";
	}
}
