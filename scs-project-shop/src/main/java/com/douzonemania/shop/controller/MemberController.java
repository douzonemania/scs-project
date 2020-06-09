package com.douzonemania.shop.controller;

import java.io.PrintWriter;

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
import com.douzonemania.shop.vo.MemberVo;

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
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("authUser");
		session.invalidate();
		
		
		return "main/index";
	}
	
	
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage() {
		return "member/mypage";
	}
}
