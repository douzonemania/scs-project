package com.douzonemania.scs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/{id:(?!assets).*}/order")
public class OrderController {

	@RequestMapping(value = "/delivery", method = RequestMethod.GET)
	public String delivery() {
		return "order/delivery";
	}

	@RequestMapping(value = "/settle", method = RequestMethod.GET)
	public String settle() {
		return "order/settle";
	}
}
