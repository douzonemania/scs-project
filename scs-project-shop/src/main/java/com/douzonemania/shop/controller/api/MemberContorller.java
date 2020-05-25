package com.douzonemania.shop.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzonemania.shop.dto.JsonResult;
import com.douzonemania.shop.service.MemberService;

@Controller("MemberApiController")
@RequestMapping("/api/member")
public class MemberContorller {

	@Autowired
	private MemberService memberService;
	
	@ResponseBody
	@RequestMapping(value="/checkid", method = RequestMethod.GET)
	public JsonResult checkid(
			@RequestParam(value="id", required=true, defaultValue="") String id) {
			boolean exist = memberService.existUser(id);
			
			return JsonResult.success(exist);
		}
}

