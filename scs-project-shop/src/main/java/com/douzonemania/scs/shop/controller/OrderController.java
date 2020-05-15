package com.douzonemania.scs.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart() {
		return "order/cart";
	}
	
	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public String complete() {
		return "order/complete";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail() {
		return "order/detail";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "order/list";
	}
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review() {
		return "order/review";
	}

}
