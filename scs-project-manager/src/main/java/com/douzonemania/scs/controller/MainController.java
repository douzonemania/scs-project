package com.douzonemania.scs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzonemania.scs.dto.JsonResult;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.security.AuthUser;

@Controller
public class MainController {
	
	@RequestMapping({"/main", ""})
	public String index() {
		
		return "main/index";
	}
	
	// authUser의 id를 react에 전달
	@ResponseBody
	@RequestMapping("/main/userId") 
	public JsonResult getAuthUserId(@AuthUser CeoVo ceoVo) {
		
		return JsonResult.success(ceoVo.getId());
	}
	
}
