package com.douzonemania.scs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
//	@Autowired
//	private MainService mainService;
	
	@RequestMapping({"/main"})
	public String index() {
		
		return "main/index";
	}
}
