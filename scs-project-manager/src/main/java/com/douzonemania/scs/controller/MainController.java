package com.douzonemania.scs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzonemania.scs.vo.ceo.CeoVo;

@Controller
@RequestMapping("/{id}")
public class MainController {
	
//	@Autowired
//	private MainService mainService;
	
	@RequestMapping({"","/main"})
	public String home() {
		
		CeoVo vo = new CeoVo();
//		vo = mainService.getList();
		System.out.println(vo);
		return "main/index";
	}
}
