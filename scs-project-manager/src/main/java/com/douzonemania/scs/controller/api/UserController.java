package com.douzonemania.scs.controller.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzonemania.scs.service.UserService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.security.AuthUser;

@Controller("apiUserController")
@RequestMapping("{id}/api/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping({"","/main"})
	public String main(@AuthUser CeoVo authUser,
			Model model) {
		
		String id = authUser.getId();
		
		 Map<String, Object> map = userService.mainView(id);
		 model.addAttribute("map", map);
		
		return "user/main";
	}
	

}