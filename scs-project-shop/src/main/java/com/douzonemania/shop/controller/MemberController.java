package com.douzonemania.shop.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzonemania.shop.service.CustomService;
import com.douzonemania.shop.service.MemberService;
import com.douzonemania.shop.service.OrderService;
import com.douzonemania.shop.vo.BoardVo;
import com.douzonemania.shop.vo.CategoryVo;
import com.douzonemania.shop.vo.ContentsVo;
import com.douzonemania.shop.vo.CustomDesignVo;
import com.douzonemania.shop.vo.ItemBoardVo;
import com.douzonemania.shop.vo.ItemVo;
import com.douzonemania.shop.vo.MainMenuVo;
import com.douzonemania.shop.vo.MemberVo;
import com.douzonemania.shop.vo.OrderListVo;
import com.douzonemania.shop.vo.SubMenuVo;

@Controller
@RequestMapping("/{db}/member")
public class MemberController {

	@Autowired
	MemberService memberService;
	@Autowired
	OrderService orderService;
	@Autowired 
	CustomService customService;
	
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String find(HttpServletRequest request, @RequestParam("isPwd") String isPwd, Model model) {
		HttpSession session = request.getSession();
		String db = session.getAttribute("db").toString();
	
		model.addAttribute("isPwd", isPwd);
		return "member/find";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(@ModelAttribute MemberVo memberVo,Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String db = session.getAttribute("db").toString();
		model.addAttribute(db);
		
		return "member/join";
	}
	
	@RequestMapping(value= "/join",method = RequestMethod.POST)
	public String  join(@ModelAttribute @Valid MemberVo vo,Model model,@PathVariable("db")String db) {
		
		memberService.insertUser(vo);
		
		return "member/joinsuccess";
		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@ModelAttribute MemberVo memberVo) {
		
		return "member/login";
	}
	
	
	@RequestMapping(value = "/login", method=RequestMethod.POST)
	public String login(@ModelAttribute MemberVo vo,@PathVariable("db")String db,HttpServletResponse response, HttpServletRequest request,Model model) throws Exception{
		int count = memberService.findUser(vo);
		
		HttpSession session = request.getSession();	
		boolean result = (count>=1)? true:false;
		
	
		
		List<Map> contentList = new ArrayList();
		List<ContentsVo> cVo = new ArrayList();		
		
		int no = customService.findSubMenuNo(db,1);
		List<CustomDesignVo> list = customService.getCustomDesignBySubMenu(no);	
		List<List<ContentsVo>> totalList = new ArrayList<List<ContentsVo>>();
		
		for (CustomDesignVo nowVo: list) {
			List<ContentsVo> contentsList = customService.getContentsByCustomNo(nowVo.getNo());
			totalList.add(contentsList);
		}
		model.addAttribute("contentsList",totalList);
		model.addAttribute("list",list);

		
		
		if(result==true) {
			vo.setNo((long)count);
			session.setAttribute("authUser", vo);
			
			return "main/index";
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
			out.flush();
	
		}
		
		return "main/login";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request,@PathVariable("db")String db,Model model) {
		
		HttpSession session = request.getSession();
		
		MainMenuVo vo = (MainMenuVo)session.getAttribute("mainMenu");
		List<CategoryVo> cglist = (List<CategoryVo>) session.getAttribute("cgList");
		List<SubMenuVo> subMenuList = (List<SubMenuVo>)session.getAttribute("subMenuList");
		
		
		
		session.removeAttribute("authUser");
		session.invalidate();
		
		List<Map> contentList = new ArrayList();
		List<ContentsVo> cVo = new ArrayList();		
		
		int no = customService.findSubMenuNo(db,1);
		List<CustomDesignVo> list = customService.getCustomDesignBySubMenu(no);	
		List<List<ContentsVo>> totalList = new ArrayList<List<ContentsVo>>();
		
		for (CustomDesignVo nowVo: list) {
			List<ContentsVo> contentsList = customService.getContentsByCustomNo(nowVo.getNo());
			totalList.add(contentsList);
		}
		model.addAttribute("contentsList",totalList);
		model.addAttribute("list",list);
		model.addAttribute("subMenuList",subMenuList);
		model.addAttribute("mainMenu", vo);
	 	model.addAttribute("cgList", cglist);
	 	
		return "main/index";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage(@ModelAttribute MemberVo vo, HttpServletRequest request, 
			Model model, HttpSession session, @PathVariable("db")String db) {
		MemberVo nowvo = (MemberVo)session.getAttribute("authUser");
		MemberVo mVo = memberService.findUserByNo(nowvo.getNo());
		
		List<OrderListVo> orderList = memberService.getOrderList(db, nowvo.getNo());		// 주문내역
		List<ItemBoardVo> itemBoardList = memberService.getItemBoardList(db, nowvo.getNo());
		List<String> priceList = orderService.convertPrice(orderList);
		List<BoardVo> qnaList = memberService.getQnaList(db, nowvo.getNo());
		List<ItemVo> cartList = memberService.getCartList(db, nowvo.getNo());
		List<Integer> restateList = orderService.getRestate(db,orderList);
		for (ItemVo itemVo : cartList) {
				int nowSale = itemVo.getSale();
				if(nowSale !=0) {
					int nowPrice= itemVo.getNowPrice();
					double calSale = (nowSale * 0.01);
					int totalPrice = nowPrice - (int)(nowPrice*calSale);
					itemVo.setTotalPrice(totalPrice);
				}else {
					itemVo.setTotalPrice(itemVo.getNowPrice());
				}
		}
		
		orderService.convertOption(db, orderList);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("cartList", cartList);
		model.addAttribute("priceList", priceList);
		model.addAttribute("itemBoardList",itemBoardList);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("vo", mVo);
		model.addAttribute("restateList", restateList);
		return "member/mypage";
	}
	
	@RequestMapping(value = "/passwordMod", method = RequestMethod.GET)
	public String passwordMod(HttpSession session, Model model) {
		MemberVo nowvo = (MemberVo)session.getAttribute("authUser");
		memberService.findUserByNo(nowvo.getNo());
		model.addAttribute("vo", memberService.findUserByNo(nowvo.getNo()));
		return "member/passwordMod";
	}
	
//	@RequestMapping()
//	public String myItemBoard(HttpServletRequest request, 
//			Model model, HttpSession session, @PathVariable("db")String db) {
//		
//	}
	
	@RequestMapping(value ="/agree/{num}")
	public String firstAgree(HttpServletRequest request,@PathVariable("num")String num,Model model) {
		HttpSession session = request.getSession();
		String db = session.getAttribute("db").toString();
		
		String agreement =  "quill2.setContents([ " + 
				memberService.findAgreement(db,num+"_agree")+ "]);";
	
		model.addAttribute("viewer",agreement);
		
		return "member/agree";
	}

}