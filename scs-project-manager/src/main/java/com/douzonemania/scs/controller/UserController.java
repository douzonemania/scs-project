package com.douzonemania.scs.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzonemania.scs.dto.JsonResult;
import com.douzonemania.scs.service.MemberService;
import com.douzonemania.scs.service.UserService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.ceo.ShipCompanyVo;
import com.douzonemania.security.AuthUser;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	// 아이디 중복 검사
	@ResponseBody
	@RequestMapping(value="/checkid", method = RequestMethod.GET)
	public JsonResult checkId(
		@RequestParam(value="id", required=true, defaultValue="") String id) {
		boolean exist = userService.existUser(id);
		return JsonResult.success(exist);
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join(@ModelAttribute CeoVo ceoVo) {
		return "user/signup";
	}
 
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(@ModelAttribute @Valid CeoVo ceoVo, BindingResult result,
			Model model) {

		if(result.hasErrors()) {
			model.addAllAttributes(result.getModel());
			return "user/signup";
		}
		
		ceoVo.setAddress(ceoVo.getAddress1() + "!" + ceoVo.getAddress2() + "!" + ceoVo.getPostcode());

		userService.insert(ceoVo);

		// 회원 DB와 table 생성
		String id = ceoVo.getId();
		userService.createDB(id);
		userService.createTable(id);
		userService.alterTable(id);
		
		return "user/join-success";
	}
	
	@RequestMapping(value="/join-success")
	public String sendEmailSuccess() {
		
		return "user/join-success";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}

	@RequestMapping(value = "/recover", method = RequestMethod.GET)
	public String recover() {
		return "user/recover";
	}
	
	@ResponseBody
	@RequestMapping(value="/find/id")
	public JsonResult findId(@RequestParam(value="name") String name,
					@RequestParam(value="phoneNum") String phoneNum) {
		
		String id = userService.findIdByNameAndPhone(name, phoneNum);
		
		return JsonResult.success(id);
	}
	
	@ResponseBody
	@RequestMapping(value="/find/password")
	public JsonResult findPassword(@RequestParam(value="id") String id,
					@RequestParam(value="email") String email) {
		
		Boolean sendPassword = userService.sendPasswordEmail(id, email); 
		
		return JsonResult.success(sendPassword);
	}
	
	@RequestMapping(value = "/agreement", method = RequestMethod.GET)
	public String agreement() {

		return "user/agreement";
	}


	@RequestMapping(value="/auth")
	public void auth() {

	}

	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public void logout() {

	}

}
