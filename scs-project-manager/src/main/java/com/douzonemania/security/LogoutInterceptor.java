package com.douzonemania.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogoutInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		System.out.println("logout interceptor in");
		System.out.println("session:" + session);
		
		session.removeAttribute("authUser");
		session.invalidate();
		
		response.sendRedirect(request.getContextPath() + "/main");
				
		return false;
	}

}
