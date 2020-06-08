package com.douzonemania.shop.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzonemania.shop.service.CustomService;

@Controller
@RequestMapping("/{db}/custom")
public class CustomController {

	@Autowired
	private CustomService customService;
	
	@RequestMapping(value = "/BEST", method = RequestMethod.GET)
	public String bestList(@RequestParam(value="p",required = true,defaultValue = "1")Integer page,
					   @RequestParam(value="kwd",required=true,defaultValue = "")String keyword,
					   @RequestParam(value="option",required = true,defaultValue = "name")String option,
					   @RequestParam(value="category",required = true,defaultValue = "0")Integer category,
					   @RequestParam(value="subCategory",required = true,defaultValue = "0")Integer subCategory,
					   Model model,HttpSession session) {
			String db = session.getAttribute("db").toString();
			Map<String,Object> map  = customService.bestFind(page,keyword,option,category,subCategory,db);
			model.addAttribute("map",map);
				
		
		return "custom/best";
	}
	
	@RequestMapping(value = "/NEW", method = RequestMethod.GET)
	public String newList(@RequestParam(value="p",required = true,defaultValue = "1")Integer page,
					   @RequestParam(value="kwd",required=true,defaultValue = "")String keyword,
					   @RequestParam(value="option",required = true,defaultValue = "name")String option,
					   @RequestParam(value="category",required = true,defaultValue = "0")Integer category,
					   @RequestParam(value="subCategory",required = true,defaultValue = "0")Integer subCategory,
					   Model model,HttpSession session) {
			String db = session.getAttribute("db").toString();
			Map<String,Object> map  = customService.newFind(page,keyword,option,category,subCategory,db);
			model.addAttribute("map",map);
				
		
		return "custom/new";
	}
	
	@RequestMapping(value = "/SALE", method = RequestMethod.GET)
	public String saleList(@RequestParam(value="p",required = true,defaultValue = "1")Integer page,
					   @RequestParam(value="kwd",required=true,defaultValue = "")String keyword,
					   @RequestParam(value="option",required = true,defaultValue = "name")String option,
					   @RequestParam(value="category",required = true,defaultValue = "0")Integer category,
					   @RequestParam(value="subCategory",required = true,defaultValue = "0")Integer subCategory,
					   Model model,HttpSession session) {
			String db = session.getAttribute("db").toString();
			Map<String,Object> map  = customService.saleFind(page,keyword,option,category,subCategory,db);
			model.addAttribute("map",map);
				
		
		return "custom/sale";
	}
}
