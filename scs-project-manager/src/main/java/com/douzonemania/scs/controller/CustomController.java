package com.douzonemania.scs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzonemania.scs.service.CustomService;
import com.douzonemania.scs.vo.ceo.ContentsVo;
import com.douzonemania.scs.vo.ceo.CustomDesignVo;

@Controller
@RequestMapping("/{db}/custom")
public class CustomController {

	@Autowired
	private CustomService customService;
	
	@RequestMapping({"","/main"})
	public String home(Model model) {
		/*
		 * List<CustomDesignVo> list = customService.getCustomDesignBySubMenu(33);
		 * List<ContentsVo> contentsList = customService.getContentsByCustomNo(14);
		 */
		//System.err.println("::::" + contentsList.get(1).getContent());
		/*
		 * System.err.println("::::" + contentsList); model.addAttribute("list", list);
		 * model.addAttribute("contentsList",contentsList);
		 */
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
