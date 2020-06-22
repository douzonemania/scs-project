package com.douzonemania.scs.controller.api;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.douzonemania.scs.dto.JsonResult;
import com.douzonemania.scs.service.OrderService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.member.OrderDeliveryVo;
import com.douzonemania.security.AuthUser;

@RestController("OrderApiController")
@RequestMapping("/{id}/api/order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	/* delivery ajax 주문/배송관리 list */
	@ResponseBody
	@GetMapping("/delivery")
	public JsonResult orderDeliveryList(
			@AuthUser CeoVo authUser,
			@RequestParam(value="startDate", required=true, defaultValue="") String startDate,
			@RequestParam(value="endDate", required=true, defaultValue="") String endDate,
			@RequestParam(value="p", required=true, defaultValue="1") int page,
			@RequestParam(value="op", required=true, defaultValue="") String option,
			@RequestParam(value="kwd", required=true, defaultValue="") String keyword,
			Model model){

		String id = authUser.getId();
		
		Map<String, Object> map = orderService.findDeliveryByDate(startDate, endDate, authUser.getId(), page, option, keyword);
		
		
		
		return JsonResult.success(map);
	}
	
	/* delivery ajax 주문/배송관리 상태 update */
	@ResponseBody
	@PostMapping("/delivery/update")
	public JsonResult orderDeliveryStatusUpdate(
			@AuthUser CeoVo authUser,
			@ModelAttribute OrderDeliveryVo orderDeliveryVo,
			@RequestBody Map<String, Object> statusMap,
			Model model){

		  int no = 0;
		  no = (int) statusMap.put("no", no);
		  String statement = "";
		  statement = (String) statusMap.put("statement", statement);
		  String id = authUser.getId();
		  orderDeliveryVo.setId(id);
		  orderService.updateStatus(id, no, statement);
		  return JsonResult.success("");
	}
	
	
	/* settle ajax 정산관리 list */
	@ResponseBody
	@GetMapping("/settle")
	public JsonResult orderSettleList(
			@AuthUser CeoVo authUser,
			@RequestParam(value="startDate", required=true, defaultValue="") String startDate,
			@RequestParam(value="endDate", required=true, defaultValue="") String endDate,
			@RequestParam(value="p", required=true, defaultValue="1") int page,
			Model model) {
		
			Map<String, Object> map = orderService.findSettleByDate(startDate, endDate, authUser.getId(), page);
			
		return JsonResult.success(map);
		
	}
	


}
