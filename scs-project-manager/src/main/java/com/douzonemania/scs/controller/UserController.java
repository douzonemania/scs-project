package com.douzonemania.scs.controller;

import javax.validation.Valid;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserController {

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup() {
		return "user/signup";
	}
	
	/*
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup() {
		return "redirect:/user/joinsuccess";
	}
	*/
	
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
