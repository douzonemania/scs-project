package com.douzonemania.scs.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.douzonemania.scs.dto.JsonResult;
import com.douzonemania.scs.service.DesignService2;
import com.douzonemania.scs.service.OrderService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.ceo.MainMenuVo;
import com.douzonemania.security.AuthUser;

@Controller("DesignApiController")
@RequestMapping("/mall2/api/design")
public class DesignController {

	@Autowired
	private DesignService2 designService;
	
	@ResponseBody
	@RequestMapping("/mainMenu")
	public JsonResult mainMenuList(@RequestBody MainMenuVo mainMenuVo) {
		System.out.println("!!!!!!!!!!!!!!!!!!!!"+mainMenuVo);
		return JsonResult.success("");
	}
	
	@ResponseBody
	@RequestMapping("/saveImg")
	public JsonResult saveImg(@RequestParam("file") MultipartFile excelFile) {
		
		String url="/scs-manager"+designService.restore(excelFile);
		
		System.out.println(url);
		return JsonResult.success(url);
	}
	
	
}
