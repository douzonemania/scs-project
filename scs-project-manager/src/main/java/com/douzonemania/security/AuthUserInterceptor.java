package com.douzonemania.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.douzonemania.scs.vo.ceo.CeoVo;

public class AuthUserInterceptor extends HandlerInterceptorAdapter {


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
    {
	 	String uri=request.getServletPath().toString();
	 	
	 	String[] strArr=uri.split("/");

	 	HttpSession session = request.getSession();
	 	 	
		
	 	CeoVo vo = new CeoVo();
	 	vo.setId("mall");
	 	session.setAttribute("authUser", vo);
	 	
        return true;
    }

}