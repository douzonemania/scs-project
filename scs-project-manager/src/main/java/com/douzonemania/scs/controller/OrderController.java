package com.douzonemania.scs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.security.AuthUser;

@Controller
@RequestMapping("/{id:(?!assets).*}/order")
public class OrderController {

	@RequestMapping(value = "/delivery", method = RequestMethod.GET)
	public String delivery(@AuthUser CeoVo authUser) {
		return "order/delivery";
	}

	@RequestMapping(value = "/settle", method = RequestMethod.GET)
	public String settle(
			@AuthUser CeoVo authUser,
			@RequestParam(value="startDate", required=true, defaultValue="") String startDate,
			@RequestParam(value="endDate", required=true, defaultValue="") String endDate
			) {
			System.out.println(startDate + " : " + endDate);
		return "order/settle";
	}
}
