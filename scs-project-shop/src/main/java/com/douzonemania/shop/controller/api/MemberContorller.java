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
	
	@ResponseBody
	@RequestMapping(value="/find/id")
	public JsonResult findId(@RequestParam(value="phoneNum") String phoneNum) {
		
		String id = memberService.findIdByPhone(phoneNum);
		
		return JsonResult.success(id);
	}
	
	@ResponseBody
	@RequestMapping(value="/find/password")
	public JsonResult findPassword(@RequestParam(value="id") String id,
					@RequestParam(value="phone") String phone) {
		
		Boolean sendPassword = memberService.sendPasswordEmail(id, phone); 
		
		return JsonResult.success(sendPassword);
	}
	
	@ResponseBody
	@RequestMapping(value="/mod/password")
	public JsonResult modPassword(@RequestParam(value="id") String id,
					@RequestParam(value="newPassword") String newPassword) {
		
		memberService.modPassword(id, newPassword);
		
		return JsonResult.success("");
	}
	
	@ResponseBody
	@RequestMapping(value="/mod/name")
	public JsonResult modName(@RequestParam(value="id") String id,
					@RequestParam(value="name") String name) {
		
		memberService.modName(id, name);
		return JsonResult.success("");
	}
	
	@ResponseBody
	@RequestMapping(value="/mod/phone")
	public JsonResult modPhone(@RequestParam(value="id") String id,
					@RequestParam(value="phone") String phone) {
		
		memberService.modPhone(id, phone);
		return JsonResult.success("");
	}
}

