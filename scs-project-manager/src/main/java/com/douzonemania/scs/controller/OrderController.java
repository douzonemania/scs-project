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
	
	/* order-delivery */
	@RequestMapping(value = "/delivery", method = {RequestMethod.GET, RequestMethod.POST })
	public String delivery(
			@AuthUser CeoVo authUser,
			@RequestParam(value="startDate", required=true, defaultValue="") String startDate,
			@RequestParam(value="endDate", required=true, defaultValue="") String endDate,
			@RequestParam(value="p", required=true, defaultValue="1") int page,
			@RequestParam(value="op", required=true, defaultValue = "") String option,
			@RequestParam(value="kwd", required=true, defaultValue= "") String keyword,
			Model model) {
			
			
		    String id = authUser.getId();
			Map<String, Object> map = orderService.findDeliveryByDate(startDate, endDate, id, page, option, keyword);
			
			model.addAttribute("map", map);
		
		return "order/delivery";
	}

	/* order-settle */
	@RequestMapping(value = "/settle", method = {RequestMethod.GET, RequestMethod.POST })
	public String settle(
			@AuthUser CeoVo authUser,
			@RequestParam(value="startDate", required=true, defaultValue="") String startDate,
			@RequestParam(value="endDate", required=true, defaultValue="") String endDate,
			@RequestParam(value="p", required=true, defaultValue="1") int page,
			Model model) {
			

			String id = authUser.getId();
			Map<String, Object> map = orderService.findSettleByDate(startDate, endDate, id, page);
			
			model.addAttribute("startDate", startDate);
			model.addAttribute("endDate", endDate);
			model.addAttribute("map", map);
		return "order/settle";
	}
}
