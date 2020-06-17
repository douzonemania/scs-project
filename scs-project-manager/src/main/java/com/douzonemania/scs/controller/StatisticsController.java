package com.douzonemania.scs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/{id:(?!assets).*}/statistics")
public class StatisticsController {

	
	@RequestMapping(value="/category", method=RequestMethod.GET)
	public String categoryGraph() {
		
		return "statistics/category";
	}
	
	@RequestMapping(value="/products", method=RequestMethod.GET)
	public String productsGraph() {
		
		return "statistics/products";
	}
	
}
