package com.douzonemania.scs.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.douzonemania.scs.service.UserService;
import com.douzonemania.scs.vo.ceo.CeoVo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join(@ModelAttribute CeoVo ceoVo) {
		return "user/signup";
	}
 
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(@ModelAttribute @Valid CeoVo ceoVo, BindingResult result,
			Model model) {

		// properties 안넣으면 에러가 안들어가요ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
		if(result.hasErrors()) {
			model.addAllAttributes(result.getModel());
			return "user/signup";
		}
		
//		model.addAllAttributes(result.getModel());

		ceoVo.setAddress(ceoVo.getAddress1() + " " + ceoVo.getAddress2());

		userService.insert(ceoVo);

		// 회원 DB와 table 생성
		String id = ceoVo.getId();
		userService.createDB(id);
		userService.createTable(id);
		userService.alterTable(id);
		
		return "redirect:/index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}

	@RequestMapping(value = "/recover", method = RequestMethod.GET)
	public String recover() {
		return "user/recover";
	}


	@RequestMapping(value="/auth", method=RequestMethod.POST)
	public void auth() {

	}

	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public void logout() {

	}

}
