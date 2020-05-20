package com.douzonemania.scs.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzonemania.scs.dto.JsonResult;
import com.douzonemania.scs.service.UserService;

@Controller("apiUserController")
@RequestMapping("/api/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping(value="/checkid", method = RequestMethod.GET)
	public JsonResult checkEmail(
		@RequestParam(value="id", required=true, defaultValue="") String id) {
		boolean exist = userService.existUser(id);
		
		return JsonResult.success(exist);
	}

}
