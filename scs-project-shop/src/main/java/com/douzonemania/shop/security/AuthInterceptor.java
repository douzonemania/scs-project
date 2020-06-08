package com.douzonemania.shop.security;

import java.net.URL;
import java.util.List;
import java.util.Locale.Category;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.douzonemania.shop.repository.MainRepository;
import com.douzonemania.shop.vo.CategoryVo;
import com.douzonemania.shop.vo.MainMenuVo;
import com.douzonemania.shop.vo.MemberVo;


public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	MainRepository mainRepository;
	
	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
	    {
		 	String uri=request.getServletPath().toString();
		 	String[] strArr=uri.split("/");
		 	
		 	HttpSession session = request.getSession();
		 	
		 	

			if(session.getAttribute("db")==null) {
		 		session.setAttribute("db", strArr[1]);
		 	} else if(!(session.getAttribute("db").equals(strArr[1]))) {
		 		session.setAttribute("db", strArr[1]);
		 	}
		 	
			MainMenuVo vo = mainMenuSetting();
			List<CategoryVo> list =categorySetting();
			
			session.setAttribute("mainMenu", vo);
		 	session.setAttribute("cgList", list);
		 	
		 	if(session.getAttribute("authUser")!=null) {
		 		MemberVo nowUser = (MemberVo)session.getAttribute("authUser");
		 		int cartCnt = mainRepository.getCartCnt(nowUser.getNo());
		 		session.setAttribute("cartCnt", cartCnt);
		 	}
		 	
	        return true;
	    }

	 
	 public MainMenuVo mainMenuSetting() {
		 MainMenuVo vo =mainRepository.getMainMenu();
		 return vo;
	 }
	 
	 public List<CategoryVo> categorySetting() {
		 List<CategoryVo> list = mainRepository.getCategoryList();
		 
		 return list;
	 }
	 
	   
}
