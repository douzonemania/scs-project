package com.douzonemania.security;

import java.io.PrintWriter;

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
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		CeoVo ceoVo = new CeoVo();
		ceoVo.setId(id);
		ceoVo.setPassword(password);
		
		CeoVo authUser = userService.getUser(ceoVo);
		
		if(authUser == null) {
			request.setAttribute("ceoVo", ceoVo);
			request
				.getRequestDispatcher("/WEB-INF/views/user/login.jsp")
				.forward(request, response);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); location.href='${pageContext.request.contextPath }/main';</script>");
			out.flush();

			return false;
		} 
		
		// session 처리
		HttpSession session = request.getSession(true);
		session.setAttribute("authUser", authUser);
		
		response.sendRedirect(request.getContextPath()+"/"+authUser.getId() + "/api/user/main");
		
		
		return false;
	}

}
