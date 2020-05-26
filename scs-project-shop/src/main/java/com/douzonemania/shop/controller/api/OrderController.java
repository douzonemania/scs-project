package com.douzonemania.shop.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzonemania.shop.dto.JsonResult;
import com.douzonemania.shop.service.OrderService;
import com.douzonemania.shop.vo.OptionVo;

@Controller("OrderApiController")
@RequestMapping("api/order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@ResponseBody
	@GetMapping("/detail/{option}/{no}")
	public JsonResult findSecondOption(
			@PathVariable("option") int option,
			@PathVariable("option") int no) {
		
		List<OptionVo> list = orderService.findSecondOption(no,option);
		
		
		return JsonResult.success(list);
	}
	
}
