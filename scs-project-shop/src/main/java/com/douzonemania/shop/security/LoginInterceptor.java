package com.douzonemania.shop.security;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


import com.douzonemania.shop.service.MemberService;
import com.douzonemania.shop.vo.MemberVo;


public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		System.out.println("LOGINSTART");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberVo vo = new MemberVo();
		
		vo.setId(id);
		vo.setPassword(password);

		int result = memberService.findUser(vo);
		
		if(result == 0) {
			request.getRequestDispatcher("/WEB-INF/views/member/login.jsp")
			.forward(request, response);
			
			return false;
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
			out.flush();
			
			HttpSession session = request.getSession(true);
			session.setAttribute("authUser", vo);
			 
			response.sendRedirect(request.getContextPath());
		}
		
		
		
		return false;
	}

}
