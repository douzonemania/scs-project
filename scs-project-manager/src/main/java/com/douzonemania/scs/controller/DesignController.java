package com.douzonemania.scs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/{db}/design")
//@RequestMapping("/mall2/design")
public class DesignController {
	
	@RequestMapping({"","/main"})
	public String home() {
		return "design/main";
	}
	
}
