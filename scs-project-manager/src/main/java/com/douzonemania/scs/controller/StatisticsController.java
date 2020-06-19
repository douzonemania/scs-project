package com.douzonemania.scs.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzonemania.scs.service.StatisticsService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.security.AuthUser;

@Controller
@RequestMapping("/{id:(?!assets).*}/statistics")
public class StatisticsController {
	
	@Autowired
	private StatisticsService statisticsService;
	
	@RequestMapping(value="/category", method=RequestMethod.GET)
	public String categoryGraph(
			@AuthUser CeoVo authUser,
			@RequestParam(value="startDate", required=true, defaultValue="") String startDate,
			@RequestParam(value="endDate", required=true, defaultValue="") String endDate,
			Model model) {
		

		String id = authUser.getId();
		Map<String, Object> map = statisticsService.categoryGraphByDate(startDate, endDate, id);
		model.addAttribute("map", map);
	
		return "statistics/category";
	}
	
	@RequestMapping(value="/products", method=RequestMethod.GET)
	public String productsGraph(
			@AuthUser CeoVo authUser,
			@RequestParam(value="startDate", required=true, defaultValue="") String startDate,
			@RequestParam(value="endDate", required=true, defaultValue="") String endDate,
			Model model) {
		
		String id = authUser.getId();
		Map<String, Object> map = statisticsService.productsGraphByDate(startDate, endDate, id);
		model.addAttribute("map", map);
		
		return "statistics/products";
	}
	
}
