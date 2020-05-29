package com.douzonemania.scs.controller.api;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.douzonemania.scs.dto.JsonResult;
import com.douzonemania.scs.service.OrderService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.security.AuthUser;

@RestController("OrderApiController")
@RequestMapping("/{id}/api/order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	/* 정산관리 list 출력 */
	@GetMapping("/settle")
	public JsonResult orderSettleList(
			@AuthUser CeoVo authUser,
			@RequestParam(value="startDate", required=true, defaultValue="") String startDate,
			@RequestParam(value="endDate", required=true, defaultValue="") String endDate,
			@RequestParam(value="p", required=true, defaultValue="1") int page,
			Model model) {
		
			Map<String, Object> map = orderService.findByDate(startDate, endDate, authUser.getId(), page);
			
		return JsonResult.success(map);
		
	}
	

}
