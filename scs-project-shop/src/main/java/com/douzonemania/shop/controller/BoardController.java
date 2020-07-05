package com.douzonemania.shop.controller;

import java.io.IOException;
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
import com.douzonemania.shop.vo.BoardVo;
import com.douzonemania.shop.vo.ContentsVo;
import com.douzonemania.shop.vo.ItemBoardVo;
import com.douzonemania.shop.vo.ItemReplyVo;
import com.douzonemania.shop.vo.MemberVo;
import com.douzonemania.shop.vo.ReplyVo;


@Controller
@RequestMapping("/{db}/board")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@Autowired
	CustomService customService;
	
	@RequestMapping(value = "/qna/write")
	public String qnaWrite() {
		return "board/qna-write";
	}
	
//	@RequestMapping(value = "/qna/list", method = { RequestMethod.GET, RequestMethod.POST })
//	public String qnaList(@RequestParam(value="p", required=true, defaultValue="1") int page,
//			@RequestParam(value="kwd", required=true, defaultValue="") String keyword,
//			@RequestParam(value="op", required=true, defaultValue="") String option,
//			Model model,HttpSession session) {
//		String db = session.getAttribute("db").toString(); 
//		
//		Map<String, Object> map = boardService.getQNAList(db, page, keyword, option);
//		model.addAttribute("map", map);
//		
//		return "board/qna-list";
//	}
	
	@RequestMapping(value="/qna/view/{no}")
	public String boardView(@PathVariable("no") int no, Model model, HttpSession session) throws IOException {
		String db = session.getAttribute("db").toString(); 
		
		BoardVo boardVo = boardService.findBoardByNo(db, no);
		String name = boardService.findNameByNo(db, boardVo.getMemberNo());
		boardVo.setName(name);

		String viewer = "quill2.setContents([ " + 
                boardVo.getContents1() +
       "]);";
		
		model.addAttribute("boardVo", boardVo);
		model.addAttribute("viewer", viewer);		// 회원이 작성한 글
		
		// 답글이 있는 경우 
		if(boardVo.isReplyState()) {
			ReplyVo replyVo = boardService.findReplyByParentsNo(db, no);
			String reply = "quill3.setContents([ " + 
			                          replyVo.getContents() +
			                 "]);";
			
			model.addAttribute("reply", reply);	
			model.addAttribute("replyVo", replyVo);	 // 관리자가 작성한 답글
		}
		
		return "board/qna-view";
	}
	
	////////////////////////////////end qna board////////////////////////////////////
	
	@RequestMapping(value = "/itemboard/write/{no}")
	public String itemBoardWrite(Model model, 
			@PathVariable(value="no") int no,
			@RequestParam(value="detail",required=false)String detail) {
		model.addAttribute("no", no);
		model.addAttribute("detail", detail);
		
		return "board/itemboard-write";
	}
	
	@RequestMapping(value = "/itemboard/list", method = { RequestMethod.GET, RequestMethod.POST })
	public String itemBoardList(@RequestParam(value="p", required=true, defaultValue="1") int page,
			@RequestParam(value="kwd", required=true, defaultValue="") String keyword,
			@RequestParam(value="op", required=true, defaultValue="") String option,
			Model model,HttpSession session) {
		String db = session.getAttribute("db").toString(); 
		
		Map<String, Object> map = boardService.getItemBoardList(db, page, keyword, option);
		model.addAttribute("map", map);
		
		return "board/itemboard-list";
	}
	
	@RequestMapping(value="/itemboard/view/{no}")
	public String itemBoardView(@PathVariable("no") int no, Model model,
			HttpSession session) throws IOException {
		String db = session.getAttribute("db").toString(); 
		
		ItemBoardVo itemBoardVo = boardService.findItemBoardByNo(db, no);
		String name = boardService.findNameByNo(db, itemBoardVo.getMemberNo());
		itemBoardVo.setName(name);
		
		String viewer = "quill2.setContents([ " + 
				itemBoardVo.getContents1() +
       "]);";
		
		model.addAttribute("itemBoardVo", itemBoardVo);
		model.addAttribute("viewer", viewer);		// 회원이 작성한 글
		
		// 답글이 있는 경우 
		if(itemBoardVo.isReplyState()) {
			ItemReplyVo itemReplyVo = boardService.findItemReplyByParentsNo(db, no);
			String reply = "quill3.setContents([ " + 
								itemReplyVo.getContents1() +
			                 "]);";
			
			model.addAttribute("reply", reply);	
			model.addAttribute("itemReplyVo", itemReplyVo);	 // 관리자가 작성한 답글

		}
		
		MemberVo nowUser = (MemberVo)session.getAttribute("authUser");
		model.addAttribute("authUser", nowUser);
	
		return "board/itemboard-view";
	}
}