package com.douzonemania.shop.security;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.douzonemania.shop.repository.MainRepository;
import com.douzonemania.shop.service.CustomService;
import com.douzonemania.shop.vo.CategoryVo;
import com.douzonemania.shop.vo.ContentsVo;
import com.douzonemania.shop.vo.MainMenuVo;
import com.douzonemania.shop.vo.MemberVo;
import com.douzonemania.shop.vo.SubMenuVo;


public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	MainRepository mainRepository;
	@Autowired
	CustomService customService;
	
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
			
			List<SubMenuVo> subMenuList = customService.getSubMenuById(session.getAttribute("db").toString());
			
			
			
			for (SubMenuVo subMenuVo : subMenuList) {
				List<ContentsVo> contentsVo = customService.getContentsByCustomNo(subMenuVo.getNo());
				//System.out.println(contentsVo);
			}
			
			session.setAttribute("subMenuList",subMenuList);
			
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
