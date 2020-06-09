package com.douzonemania.scs.controller.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzonemania.scs.dto.JsonResult;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.ceo.MainMenuVo;
import com.douzonemania.security.AuthUser;

@Controller("DesignApiController")
@RequestMapping("/mall2/api/design")
public class DesignController {

	@ResponseBody
	@RequestMapping("/mainMenu")
	public JsonResult mainMenuList(@RequestBody MainMenuVo mainMenuVo) {
		System.out.println("!!!!!!!!!!!!!!!!!!!!"+mainMenuVo);
		return JsonResult.success("");
	}
	
}
