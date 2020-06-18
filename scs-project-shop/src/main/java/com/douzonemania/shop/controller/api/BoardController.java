package com.douzonemania.shop.controller.api;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzonemania.shop.dto.JsonResult;
import com.douzonemania.shop.service.BoardService;
import com.douzonemania.shop.vo.MemberVo;

@Controller("BoardApiController")
@RequestMapping("{id}/api/board")
public class BoardController {

	@Autowired BoardService boardService;
	
	@ResponseBody
	@RequestMapping(value="/qna/write", method=RequestMethod.POST)
	public JsonResult writeQna(@RequestBody String html,
			HttpSession session) {
		
		String db = session.getAttribute("db").toString();
		MemberVo authUser = (MemberVo)session.getAttribute("authUser");
		
		boolean qnaResult = boardService.writeQna(html, authUser.getNo(), db);
		
		return JsonResult.success(qnaResult);
	}
	
	@ResponseBody
	@RequestMapping(value="/qna/delete/{no}")
	public JsonResult deleteBoard(@PathVariable int no, HttpSession session) {
		String db = session.getAttribute("db").toString();

		boolean deleteResult = boardService.deleteBoard(db, no);
		
		return JsonResult.success(deleteResult);
	}
	
	@ResponseBody
	@RequestMapping(value="/itemboard/write/{no}", method=RequestMethod.POST)
	public JsonResult writeItemBoard(@RequestBody String html, 
			@PathVariable("no") int itemNo, HttpSession session) {
		
		String db = session.getAttribute("db").toString();
		MemberVo authUser = (MemberVo)session.getAttribute("authUser");
		
		boolean qnaResult = boardService.writeItemBoard(html, authUser.getNo(), itemNo, db);
		
		return JsonResult.success(qnaResult);
	}
	
	@ResponseBody
	@RequestMapping(value="/itemboard/delete/{no}")
	public JsonResult deleteItemBoard(@PathVariable int no, HttpSession session) {
		String db = session.getAttribute("db").toString();
		
		boolean deleteResult = boardService.deleteItemBoard(db, no);
		
		return JsonResult.success(deleteResult);
	}
}
