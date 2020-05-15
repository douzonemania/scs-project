package com.douzonemania.scs.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.douzonemania.scs.vo.ceo.CeoVo;


@Controller
public class CeoController {

	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join(@ModelAttribute CeoVo ceoVo) {
		return "user/join";
	}

	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(@Valid CeoVo ceoVo, Model model) {
//		ceoService.insert(ceoVo);
		String id = ceoVo.getId();
		
		
		
		return "main";
	}
	
}
