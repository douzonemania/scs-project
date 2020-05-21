package com.douzonemania.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.douzonemania.scs.service.UserService;
import com.douzonemania.scs.vo.ceo.CeoVo;



public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("interceptor 들어왔다!!!!!!!!!!!!!!!!!!!!");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		CeoVo ceoVo = new CeoVo();
		ceoVo.setId(id);
		ceoVo.setPassword(password);
		
		CeoVo authUser = userService.getUser(ceoVo);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~" + authUser);
		
		if(authUser == null) {
			request.setAttribute("ceoVo", ceoVo);
			request
				.getRequestDispatcher("/WEB-INF/views/user/login.jsp")
				.forward(request, response);
			return false;
		}
		
		
		// session 처리
		HttpSession session = request.getSession(true);
		session.setAttribute("authUser", authUser);
		response.sendRedirect(request.getContextPath());
		
		return false;
	}

}
