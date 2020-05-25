package com.douzonemania.scs.controller.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.security.AuthUser;

@Controller("apiUserController")
@RequestMapping("{id}/api/user")
public class UserController {
	
	@RequestMapping({"","/main"})
	public String main(@AuthUser CeoVo authUser) {
		
		return "user/main";
	}
	

}