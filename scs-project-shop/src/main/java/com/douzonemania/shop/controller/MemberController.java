package com.douzonemania.shop.controller;

import java.io.PrintWriter;
import java.util.List;

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

import com.douzonemania.shop.service.MemberService;
import com.douzonemania.shop.vo.BoardVo;
import com.douzonemania.shop.vo.ItemBoardVo;
import com.douzonemania.shop.vo.MemberVo;
import com.douzonemania.shop.vo.OrderListVo;

@Controller
@RequestMapping("/{db}/member")
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String find(HttpServletRequest request, @RequestParam("isPwd") String isPwd, Model model) {
		HttpSession session = request.getSession();
		String db = session.getAttribute("db").toString();
		System.err.println(isPwd + "!!!!!");
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
	public String login(@ModelAttribute MemberVo vo,@PathVariable("db")String db,HttpServletResponse response, HttpServletRequest request) throws Exception{
		int count = memberService.findUser(vo);
		
		HttpSession session = request.getSession();	
		boolean result = (count>=1)? true:false;
		
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
		
		return "/member/login";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request,@PathVariable("db")String db) {
		
		HttpSession session = request.getSession();
	
		session.removeAttribute("authUser");
		session.invalidate();
		
		
		return "main/index";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage(@ModelAttribute MemberVo vo, HttpServletRequest request, 
			Model model, HttpSession session, @PathVariable("db")String db) {
		MemberVo nowvo = (MemberVo)session.getAttribute("authUser");
		memberService.findUserByNo(nowvo.getNo());
		
		List<OrderListVo> orderList = memberService.getOrderList(db, nowvo.getNo());		// 주문내역
		List<ItemBoardVo> itemBoardList = memberService.getItemBoardList(db, nowvo.getNo());
		List<BoardVo> qnaList = memberService.getQnaList(db, nowvo.getNo());
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("itemBoardList",itemBoardList);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("vo", memberService.findUserByNo(nowvo.getNo()));
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
}
