package com.douzonemania.shop.controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzonemania.shop.service.OrderService;
import com.douzonemania.shop.vo.CartVo;
import com.douzonemania.shop.vo.ItemVo;
import com.douzonemania.shop.vo.MemberVo;
import com.douzonemania.shop.vo.OptionVo;

@Controller
@RequestMapping("/{db}/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam(value="p",required = true,defaultValue = "1")Integer page,
					   @RequestParam(value="kwd",required=true,defaultValue = "")String keyword,
					   @RequestParam(value="option",required = true,defaultValue = "name")String option,
					   @RequestParam(value="category",required = true,defaultValue = "1")Integer category,
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
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(
			HttpSession session,
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

	

}
