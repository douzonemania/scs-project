package com.douzonemania.shop.controller.api;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzonemania.shop.dto.JsonResult;
import com.douzonemania.shop.service.BoardService;
import com.douzonemania.shop.vo.MemberVo;

@Controller("BoardApiController")
@RequestMapping("/api/board")
public class BoardController {

	@Autowired BoardService boardService;
	
	@ResponseBody
	@RequestMapping(value="/qna/write", method=RequestMethod.POST)
	public JsonResult writeQna(@RequestBody String html,
			@RequestParam(value="op", required=true, defaultValue="") String option,
			HttpSession session) {
		
		String db = session.getAttribute("db").toString();
		MemberVo authUser = (MemberVo)session.getAttribute("authUser");
		System.out.println(html);
		System.out.println(option);
		
		
		boolean qnaResult = boardService.writeQna(html, option,authUser.getId(), db);
		
		return JsonResult.success(qnaResult);
	}
}
