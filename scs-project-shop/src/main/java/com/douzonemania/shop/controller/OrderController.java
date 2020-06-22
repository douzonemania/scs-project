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
import com.douzonemania.shop.vo.ItemBoardVo;
import com.douzonemania.shop.vo.ItemVo;
import com.douzonemania.shop.vo.MemberVo;
import com.douzonemania.shop.vo.OptionVo;
import com.douzonemania.shop.vo.OrderListVo;
import com.douzonemania.shop.vo.ReviewVo;

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
		List<ReviewVo> reviewList= orderService.getReviewList(no,db);
		List<ItemBoardVo> boardList= orderService.getBoardList(no,db);
		System.out.println(map);
		System.err.println("reviewList ::: " + reviewList);
		System.err.println("boardList::: " + boardList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("reviewList",reviewList);
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
		
		for (ItemVo itemVo : list) {
			System.out.println(itemVo.toString());
		}		
		
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
			
		System.out.println("TEST");
		
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
	
	@RequestMapping(value = "/regReview", method = RequestMethod.POST)
	public String regReview(HttpSession session,Model model,
			@RequestParam(value="itemNo") int itemNo,
			@RequestParam(value="memberNo") int memberNo,
			@RequestParam(value="stockNo") int stockNo,
			@RequestParam(value="orderNo") String orderNo,
			@RequestParam(value="image") String image,
			@RequestParam(value="itemName") String itemName,
			@RequestParam(value="itemSize") String itemSize,
			@RequestParam(value="itemColor") String itemColor) {
		
		model.addAttribute("itemNo", itemNo);
		model.addAttribute("memberNo", memberNo);
		model.addAttribute("orderNo", orderNo);
		model.addAttribute("stockNo", stockNo);
		model.addAttribute("image", image);
		model.addAttribute("itemName", itemName);
		model.addAttribute("itemSize", itemSize);
		model.addAttribute("itemColor", itemColor);
		return "order/review-reg";
	}	

	@RequestMapping(value = "/orderlist", method = {RequestMethod.POST,RequestMethod.GET})
	public String orderlist(HttpSession session,Model model
			) {
		String db = session.getAttribute("db").toString();
		String statement ="init";
		MemberVo vo = (MemberVo)session.getAttribute("authUser");
		List<OrderListVo> oVo = orderService.getOrderList(db, vo.getNo());
		List<String> priceList = orderService.convertPrice(oVo);
		List<Integer> stList = orderService.getCountStatement(db, oVo);
		List<Integer> restateList = orderService.getRestate(db,oVo);
		orderService.convertOption(db, oVo);
		System.err.println("::::" + oVo);
		model.addAttribute("statement", statement); 
		model.addAttribute("stList",stList);
		model.addAttribute("priceList", priceList);
		model.addAttribute("orderList", oVo);
		model.addAttribute("restateList", restateList);
		return "order/orderlist";
	}
	
	@RequestMapping(value = "/orderlist/{statement}", method = {RequestMethod.POST,RequestMethod.GET})
	public String orderListByStatement(HttpSession session,Model model,
			@PathVariable("statement") String statement,
			@RequestParam(value="date", defaultValue="noneDate") String date
			) {	
		model.addAttribute("statement",statement);

		String db = session.getAttribute("db").toString();
		MemberVo vo = (MemberVo)session.getAttribute("authUser");
		List<OrderListVo> oVo;
		if("noneDate".equals(date)) {
			oVo = orderService.getOrderList(db, vo.getNo(), statement);
		}else {
			oVo = orderService.getOrderList(db, vo.getNo(), statement, date);
		}
		List<Integer> restateList = orderService.getRestate(db,oVo);
		List<String> priceList = orderService.convertPrice(oVo);
		List<Integer> stList = orderService.getCountStatement(db, oVo);
		orderService.convertOption(db, oVo);
		model.addAttribute("stList",stList);
		model.addAttribute("priceList", priceList);
		model.addAttribute("orderList", oVo);
		model.addAttribute("restateList", restateList);
		return "order/orderlist";
	}
	
	/*
	 * @RequestMapping(value = "/board-write/{no}", method =
	 * {RequestMethod.POST,RequestMethod.GET}) public String
	 * orderListByStatement(HttpSession session,Model model,
	 * 
	 * @PathVariable(value="no") int no,
	 * 
	 * @RequestParam(value="itemName") String itemName ) {
	 * System.err.println(no+"no::::"); String db =
	 * session.getAttribute("db").toString(); MemberVo vo =
	 * (MemberVo)session.getAttribute("authUser"); model.addAttribute("no", no);
	 * model.addAttribute("itemName", itemName);
	 * 
	 * 
	 * return "order/board-write"; }
	 */


}
