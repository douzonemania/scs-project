package com.douzonemania.shop.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzonemania.shop.service.BoardService;
import com.douzonemania.shop.service.CustomService;
import com.douzonemania.shop.service.OrderService;
import com.douzonemania.shop.vo.ContentsVo;
import com.douzonemania.shop.vo.CustomDesignVo;
import com.douzonemania.shop.vo.SubMenuVo;

@Controller
@RequestMapping("/{db}/custom")
public class CustomController {

	@Autowired
	private CustomService customService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/{no}")
	public String home(Model model,HttpSession session,
			@PathVariable("no") int no
			) {
		String db = session.getAttribute("db").toString();

		List<CustomDesignVo> list = customService.getCustomDesignBySubMenu(no);
		List<List<ContentsVo>> totalList = new ArrayList<List<ContentsVo>>();
 
		for (CustomDesignVo vo: list) {
			List<ContentsVo> contentsList = customService.getContentsByCustomNo(vo.getNo());
			totalList.add(contentsList);
		}
		
		model.addAttribute("contentsList",totalList);
		
		for (List<ContentsVo> list2 : totalList) {
			System.out.println(list2);
		}
		
		model.addAttribute("list",list);
	
		for (CustomDesignVo list2 : list) {
			System.out.println(list2);
		}
		
		
		return "custom/customindex";
	}
	
	@RequestMapping(value = "/BEST", method = RequestMethod.GET)
	public String bestList(@RequestParam(value="p",required = true,defaultValue = "1")Integer page,
					   @RequestParam(value="kwd",required=true,defaultValue = "")String keyword,
					   @RequestParam(value="option",required = true,defaultValue = "name")String option,
					   @RequestParam(value="category",required = true,defaultValue = "0")Integer category,
					   @RequestParam(value="subCategory",required = true,defaultValue = "0")Integer subCategory,
					   Model model,HttpSession session) {
			String db = session.getAttribute("db").toString();
			Map<String,Object> map  = customService.bestFind(page,keyword,option,category,subCategory,db);
			model.addAttribute("map",map);
				
		
		return "custom/best";
	}
	
	@RequestMapping(value = "/NEW", method = RequestMethod.GET)
	public String newList(@RequestParam(value="p",required = true,defaultValue = "1")Integer page,
					   @RequestParam(value="kwd",required=true,defaultValue = "")String keyword,
					   @RequestParam(value="option",required = true,defaultValue = "name")String option,
					   @RequestParam(value="category",required = true,defaultValue = "0")Integer category,
					   @RequestParam(value="subCategory",required = true,defaultValue = "0")Integer subCategory,
					   Model model,HttpSession session) {
			String db = session.getAttribute("db").toString();
			Map<String,Object> map  = customService.newFind(page,keyword,option,category,subCategory,db);
			model.addAttribute("map",map);
		
		return "custom/new";
	}
	
	@RequestMapping(value = "/SALE", method = RequestMethod.GET)
	public String saleList(@RequestParam(value="p",required = true,defaultValue = "1")Integer page,
					   @RequestParam(value="kwd",required=true,defaultValue = "")String keyword,
					   @RequestParam(value="option",required = true,defaultValue = "name")String option,
					   @RequestParam(value="category",required = true,defaultValue = "0")Integer category,
					   @RequestParam(value="subCategory",required = true,defaultValue = "0")Integer subCategory,
					   Model model,HttpSession session) {
			String db = session.getAttribute("db").toString();
			Map<String,Object> map  = customService.saleFind(page,keyword,option,category,subCategory,db);
			model.addAttribute("map",map);
				
		
		return "custom/sale";
	}
	
	@RequestMapping(value = "/FAQ")
	public String faq(Model model, HttpSession session) {
		String db = session.getAttribute("db").toString(); 
		/* boardRepository.getSession(); */
		int customNo = customService.getCustomNo(2, db);
		
		List<ContentsVo> list = customService.getContentsByCustomNo(customNo);
		
		model.addAttribute("list", list);
	
		return "board/faq";
	}
	
	@RequestMapping(value="/REVIEW", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewList(@RequestParam(value="p", required=true, defaultValue="1") int page,
			Model model,HttpSession session) {
		
		String db = session.getAttribute("db").toString(); 

		Map<String, Object> map = orderService.getAllReviewList(page, db);
		
		model.addAttribute("map", map);
		
		return "order/review";
	}
	
	@RequestMapping(value = "/Q&A", method = { RequestMethod.GET, RequestMethod.POST })
	public String qnaList(@RequestParam(value="p", required=true, defaultValue="1") int page,
			@RequestParam(value="kwd", required=true, defaultValue="") String keyword,
			@RequestParam(value="op", required=true, defaultValue="") String option,
			Model model,HttpSession session) {
		String db = session.getAttribute("db").toString(); 
		
		Map<String, Object> map = boardService.getQNAList(db, page, keyword, option);
		model.addAttribute("map", map);
		
		return "board/qna-list";
	}
	
	@RequestMapping(value = "/left-nav")
	public String leftBar(Model model,HttpSession session) {
		String db = session.getAttribute("db").toString();
		List<SubMenuVo> subMenuList = customService.getSubMenuById(db);
		
		model.addAttribute("subMenuList",subMenuList);
		return "custom/left-nav";
	}
	
	@RequestMapping("/designSource10")
	public String custom9(Model model) {
		return "custom/designSource10";
	}	
	

}
