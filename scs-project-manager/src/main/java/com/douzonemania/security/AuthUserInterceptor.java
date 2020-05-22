package com.douzonemania.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthUserInterceptor extends HandlerInterceptorAdapter {


	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
    {
	 	String uri=request.getServletPath().toString();
	 	
	 	String[] strArr=uri.split("/");
	 	
	 	System.out.println("NOW :"+strArr[1]);
	
	 	HttpSession session = request.getSession();
	 	
		System.out.println("A :"+session.getAttribute("db"));
		
	 	
	 	if(session.getAttribute("db")==null) {
	 		session.setAttribute("db", strArr[1]);
	 	} else if(!(session.getAttribute("db").equals(strArr[1]))) {
	 		session.setAttribute("db", strArr[1]);
	 	}
	 	
        return true;
    }
}