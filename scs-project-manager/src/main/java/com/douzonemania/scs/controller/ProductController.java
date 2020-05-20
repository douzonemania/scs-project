package com.douzonemania.scs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/{id:(?!assets).*}/product")
public class ProductController {
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info() {
		return "product/info";
	}

	@RequestMapping(value = "/reg", method = RequestMethod.GET)
	public String reg() {
		return "product/reg";
	}
	@RequestMapping(value = "/category-reg", method = RequestMethod.GET)
	public String categoryReg() {
		System.out.println("바보야");
		return "product/category-reg";
	}
	
}
