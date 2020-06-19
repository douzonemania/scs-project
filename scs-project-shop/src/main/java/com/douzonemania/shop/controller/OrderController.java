package com.douzonemania.shop.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzonemania.shop.service.OrderService;
import com.douzonemania.shop.vo.ItemVo;
import com.douzonemania.shop.vo.MemberVo;
import com.douzonemania.shop.vo.OptionVo;
import com.douzonemania.shop.vo.OrderListVo;

@Controller
@RequestMapping("/{db}/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam(value="p",required = true,defaultValue = "1")Integer page,
					   @RequestParam(value="kwd",required=true,defaultValue = "")String keyword,
					   @RequestParam(value="option",required = true,defaultValue = "name")String option,
					   @RequestParam(value="category",required = true,defaultValue = "0")Integer category,
					   @RequestParam(value="subCategory",required = true,defaultValue = "0")Integer subCategory,
					   Model model,HttpSession session) {
			String db = session.getAttribute("db").toString();
			Map<String,Object> map  = orderService.find(page,keyword,option,category,subCategory,db);
			model.addAttribute("map",map);
				
		
		return "order/list";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@RequestParam(value="no", required = true,defaultValue = "0") Integer no,Model model,HttpSession session) {
		
		String db = session.getAttribute("db").toString();
		Map<String,Object> map= orderService.findProduct(no,db);
		
		List<OptionVo> optionList= orderService.findOptionList(no,db);
		
		model.addAttribute("map",map);
		model.addAttribute("option",optionList);
		
		return "order/detail";
	}
	
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(
			HttpSession session,
			Model model) {
		
		String db = session.getAttribute("db").toString();
		MemberVo vo = (MemberVo)session.getAttribute("authUser");
		
		if(vo==null) {
			return "member/login";
		}
		List<ItemVo> list = orderService.setCartList(db,vo.getNo());
		model.addAttribute("list",list);
			
		return "order/cart";
	}
	
	@RequestMapping(value = "/directorder", method = RequestMethod.GET)
	public String order(
			HttpSession session,Model model,
			@RequestParam(value="itemno",required = true,defaultValue = "0")Integer itemNo,
			@RequestParam(value="firstoption",required=true,defaultValue = "")Integer firstOption,
			@RequestParam(value="secondoption",required = true,defaultValue = "")Integer secondOption,
			@RequestParam(value="quantity",required = true,defaultValue = "0")Integer quantity
			
			) {
			
		
		String db = session.getAttribute("db").toString();
		MemberVo vo = (MemberVo)session.getAttribute("authUser");
		
		orderService.setOrderPage(db,vo.getNo(),itemNo,firstOption,secondOption,quantity,session);
		
		return "order/order";
	}
	
	
	
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(HttpSession session,
			Model model
			) {
			
		String db = session.getAttribute("db").toString();
		MemberVo vo = (MemberVo)session.getAttribute("authUser");
		
		return "order/order";
	}
	
	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public String complete() {
		return "order/complete";
	}
	
	
	
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review() {
		return "order/review";
	}

	@RequestMapping(value = "/orderlist", method = RequestMethod.GET)
	public String orderlist(HttpSession session,Model model
			) {
		String db = session.getAttribute("db").toString();
		MemberVo vo = (MemberVo)session.getAttribute("authUser");
		List<OrderListVo> oVo = orderService.getOrderList(db, vo.getNo());
		List<String> priceList = orderService.convertPrice(oVo);
		List<Integer> stList = orderService.getCountStatement(oVo);
		orderService.convertOption(db, oVo);
		model.addAttribute("stList",stList);
		model.addAttribute("priceList", priceList);
		model.addAttribute("orderList", oVo);
		return "order/orderlist";
	}
	
	@RequestMapping(value = "/orderlist/{statement}", method = RequestMethod.GET)
	public String orderListByStatement(HttpSession session,Model model,
			@PathVariable("statement") String statement
			) {
		if("oc".equals(statement)) {
			statement="주문완료";
		}else if("depc".equals(statement)) {
			statement="입금완료";
		}else if("pfd".equals(statement)) {
			statement="배송준비중";
		}else if("sip".equals(statement)) {
			statement="배송중";
		}else if("delc".equals(statement)) {
			statement="배송완료";
		}else if("canp".equals(statement)) {
			statement="취소처리중";
		}else if("chanp".equals(statement)) {
			statement="교환처리중";
		}else if("rp".equals(statement)) {
			statement="환불처리중";
		}else if("pc".equals(statement)) {
			statement="처리완료";
		}
		String db = session.getAttribute("db").toString();
		MemberVo vo = (MemberVo)session.getAttribute("authUser");
		List<OrderListVo> oVo = orderService.getOrderList(db, vo.getNo(), statement);
		List<String> priceList = orderService.convertPrice(oVo);
		List<Integer> stList = orderService.getCountStatement(oVo);
		orderService.convertOption(db, oVo);
		model.addAttribute("stList",stList);
		model.addAttribute("priceList", priceList);
		model.addAttribute("orderList", oVo);
		return "order/orderlist";
	}
	

}
