package com.douzonemania.shop.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzonemania.shop.service.CustomService;
import com.douzonemania.shop.vo.ContentsVo;
import com.douzonemania.shop.vo.CustomDesignVo;

@Controller
@RequestMapping("/{db}")
public class MainController {
	
	@Autowired
	private CustomService customService;
	
	
	@RequestMapping({"","/main"})
	public String home(HttpSession session,Model model) {
		String db = session.getAttribute("db").toString();

		List<Map> contentList = new ArrayList();
		List<ContentsVo> cVo = new ArrayList();		
		
		int no = customService.findSubMenuNo(db,1);
		List<CustomDesignVo> list = customService.getCustomDesignBySubMenu(no);	
		List<List<ContentsVo>> totalList = new ArrayList<List<ContentsVo>>();
		
		for (CustomDesignVo vo: list) {
			List<ContentsVo> contentsList = customService.getContentsByCustomNo(vo.getNo());
			totalList.add(contentsList);
		}
		model.addAttribute("contentsList",totalList);
		model.addAttribute("list",list);
	
		
		
		return "main/index";
	}
}