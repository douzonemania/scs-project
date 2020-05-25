package com.douzonemania.shop.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzonemania.shop.service.OrderService;

@Controller
@RequestMapping("/{db}/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam(value="p",required = true,defaultValue = "1")Integer page,
					   @RequestParam(value="kwd",required=true,defaultValue = "")String keyword,
					   @RequestParam(value="option",required = true,defaultValue = "name")String option,
					   @RequestParam(value="category",required = true,defaultValue = "1")Integer category,
					   @RequestParam(value="subCategory",required = true,defaultValue = "0")Integer subCategory,
					   Model model,HttpSession session) {
		
			Map<String,Object> map  = orderService.find(page,keyword,option,category,subCategory);
			model.addAttribute("map",map);
				
		
		return "order/list";
	}
	
	
	
	
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
	
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review() {
		return "order/review";
	}

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order() {
		return "order/order";
	}

}
