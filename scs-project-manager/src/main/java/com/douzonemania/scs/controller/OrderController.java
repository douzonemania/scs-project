package com.douzonemania.scs.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzonemania.scs.service.OrderService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.security.AuthUser;

@Controller
@RequestMapping("/{id:(?!assets).*}/order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/delivery", method = RequestMethod.GET)
	public String delivery(@AuthUser CeoVo authUser) {
		return "order/delivery";
	}

	@RequestMapping(value = "/settle", method = {RequestMethod.GET, RequestMethod.POST })
	public String settle(
			@AuthUser CeoVo authUser,
			@RequestParam(value="startDate", required=true, defaultValue="") String startDate,
			@RequestParam(value="endDate", required=true, defaultValue="") String endDate,
			@RequestParam(value="p", required=true, defaultValue="1") int page,
			Model model) {
			System.out.println(startDate + " :1: " + endDate);
			System.out.println("order settle 한다.");
			
			
			Map<String, Object> map = orderService.findByDate(startDate, endDate, authUser.getId(), page);
			
			model.addAttribute("startDate", startDate);
			model.addAttribute("endDate", endDate);
			model.addAttribute("map", map);
		return "order/settle";
	}
}
