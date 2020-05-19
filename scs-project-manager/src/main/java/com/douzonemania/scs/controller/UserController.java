package com.douzonemania.scs.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.douzonemania.scs.repository.TestRepository;
import com.douzonemania.scs.service.UserService;
import com.douzonemania.scs.vo.ceo.CeoVo;

@Controller
@RequestMapping("/user")
public class UserController {

	
	@Autowired
	UserService userService;
	
	@Autowired
	TestRepository test;

	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join(@ModelAttribute CeoVo ceoVo) {
		System.out.println("START");
		
		System.out.println(test.getUserList());
		
		return "user/join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(@ModelAttribute @Valid CeoVo ceoVo, BindingResult result, Model model) {

		model.addAllAttributes(result.getModel());
		
		userService.insert(ceoVo);
		String id = ceoVo.getId();
		userService.createDB(id);
		
		return "";
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
