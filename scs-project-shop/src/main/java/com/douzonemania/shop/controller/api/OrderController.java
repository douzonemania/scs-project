package com.douzonemania.shop.controller.api;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzonemania.shop.dto.JsonResult;
import com.douzonemania.shop.service.OrderService;
import com.douzonemania.shop.vo.ItemVo;
import com.douzonemania.shop.vo.MemberVo;
import com.douzonemania.shop.vo.OptionVo;
import com.douzonemania.shop.vo.ReviewVo;

@Controller("OrderApiController")
@RequestMapping("api/order")
public class OrderController {

	@Autowired
	private OrderService orderService;

	@ResponseBody
	@GetMapping("/detail/{option}/{no}")
	public JsonResult findSecondOption(
			@PathVariable("option") int option,
			@PathVariable("no") int no,
			HttpSession session) {
		
		String db = session.getAttribute("db").toString();
		
		List<OptionVo> list = orderService.findSecondOption(no,option,db);
		
		return JsonResult.success(list);
	}
	
	@ResponseBody
	@GetMapping("cart/insert/{no}/{firstOption}/{secondOption}/{quantity}")
	public JsonResult insertCart(
			@PathVariable("no") int no, 
			@PathVariable(name="firstOption") int firstOption,
			@PathVariable(name="secondOption") Optional<Integer> secondOption,
			@PathVariable("quantity") int quantity,
			HttpSession session
			){
		
		String db = session.getAttribute("db").toString();	
		MemberVo nowUser = (MemberVo)session.getAttribute("authUser");
		
		if(nowUser==null) {
			return JsonResult.success(false);
		}
		
		
		long memberNo = nowUser.getNo();
		int tempSecondOption = secondOption.isPresent() ? secondOption.get() : 0;
		orderService.setCart(no,firstOption,tempSecondOption,quantity,db,memberNo);
		
		return JsonResult.success(true);
	}
	
	@ResponseBody
	@GetMapping("cart/delete/{cartNo}")
	public JsonResult deleteCart(
			HttpSession session,
			@PathVariable("cartNo") int cartNo) {
		
		
		String db = session.getAttribute("db").toString();	
		MemberVo vo = (MemberVo)session.getAttribute("authUser");
		
		orderService.deleteCart(db,vo.getNo(),cartNo);
		
		return JsonResult.success("");
		
	}
	
	@ResponseBody
	@GetMapping(value="cart/delete-all")
	public JsonResult deleteCart(
			HttpSession session
			) {
		
		String db = session.getAttribute("db").toString();	
		MemberVo vo = (MemberVo)session.getAttribute("authUser");
		
		//orderService.deleteCartAll(db,vo.getNo());
		
		return JsonResult.success("");
		
	}
	
	@ResponseBody
	@RequestMapping(value="/order",method=RequestMethod.POST)
	public JsonResult order(
			HttpSession session,
			@RequestParam(value="cartNoList[]") List<Integer> cartNoList,
			@RequestParam(value="amountList[]") List<Integer> amountList
			) {
		
		String db = session.getAttribute("db").toString();
		MemberVo vo = (MemberVo)session.getAttribute("authUser");	
	
		orderService.setOrderPage(db,vo.getNo(),cartNoList,amountList,session);
		
		return JsonResult.success("");
		
	}
	
	@ResponseBody
	@RequestMapping(value="/insertShip", method = RequestMethod.POST)
	public JsonResult insertShip(
			@RequestBody Map<String, Object> map,
			HttpSession session) {
		
		String db = session.getAttribute("db").toString();
		MemberVo vo = (MemberVo)session.getAttribute("authUser");
		List<ItemVo> list = (List<ItemVo>)session.getAttribute("orderList");
	
		
		String shipMemo = (String) map.get("shipMemo");
		
		int shipNo = orderService.insertShip(db,vo.getNo(),map);
		
		
		String orderNum = orderService.excuteOrder(db,vo.getNo(),list,shipMemo,shipNo);
		
		return JsonResult.success(orderNum);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/excuteOrder", method = RequestMethod.POST)
	public JsonResult excuteOrder(
			@RequestBody Map<String, Object> map,
			HttpSession session) {
		
		String db = session.getAttribute("db").toString();
		MemberVo vo = (MemberVo)session.getAttribute("authUser");
		List<ItemVo> list = (List<ItemVo>)session.getAttribute("orderList");
		String shipMemo = (String) map.get("shipMemo");
		String nowNo = (String) map.get("shipNo");
		int shipNo = Integer.parseInt(nowNo);
		orderService.updateShip(db,vo.getNo(),map);
		
		
		String orderNum = orderService.excuteOrder(db,vo.getNo(),list,shipMemo,shipNo);
		
		return JsonResult.success(orderNum);
	}
	
	@ResponseBody
	@RequestMapping(value="/regReview", method = RequestMethod.POST)
	public JsonResult regReview(
			@RequestBody ReviewVo rVo, HttpSession session
			) {
		String db = session.getAttribute("db").toString();
		orderService.regReview(db, rVo);
		return JsonResult.success("");
	}
}

























