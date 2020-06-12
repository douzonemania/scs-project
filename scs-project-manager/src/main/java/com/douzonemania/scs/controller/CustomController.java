package com.douzonemania.scs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/{db}/custom")
public class CustomController {

	@RequestMapping({"","/main"})
	public String home() {
		return "custom/main";
	}
	
	@RequestMapping("/designSource4")
	public String custom4() {
		return "custom/designSource4";
	}
	
	@RequestMapping("/designSource9")
	public String custom9(Model model) {
		return "custom/designSource9";
	}	
	
	@RequestMapping("/designSource10")
	public String custom10() {
		return "custom/designSource10";
	}
	
	@RequestMapping("/designSource11")
	public String custom11() {
		return "custom/designSource11";
	}
}
