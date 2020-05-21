package com.douzonemania.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthUserInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getServletPath().toString();

		String[] strArr = uri.split("/");

		System.out.println(strArr[1]);


		HttpSession session = request.getSession();

		if (session.getAttribute("name") == null) {
			session.setAttribute("name", strArr[1]);
		}

		return true;
	}


}