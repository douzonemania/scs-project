package com.douzonemania.scs.controller;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzonemania.scs.service.MemberService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.member.BoardVo;
import com.douzonemania.scs.vo.member.ReplyVo;
import com.douzonemania.security.AuthUser;

// 회원 관리
@Controller
@RequestMapping("/{id}/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;

	
	@RequestMapping(value= {"", "/list"}, method = { RequestMethod.GET, RequestMethod.POST })
	public String memberList(@AuthUser CeoVo authUser, Model model,
			@RequestParam(value="p", required=true, defaultValue="1") int page,
			@RequestParam(value="kwd", required=true, defaultValue="") String keyword,
			@RequestParam(value="op", required=true, defaultValue="") String option) {

		Map<String, Object> map = memberService.memberList(authUser.getId(), page, keyword, option);
		
		
		model.addAttribute("map", map);
		
		return "member/list";
	}
	
	
	// list에서 메일 발송 버튼을 눌러 전송할 경우(회원 email정보를 받아와야함)
	@RequestMapping(value = "/email/{no}", method = RequestMethod.GET)
	public String sendMemberEmail(@PathVariable("no") int no,
					@AuthUser CeoVo authUser, Model model) {
		
		String memberEmail = memberService.getMemberEmail(authUser.getId(), no);

		model.addAttribute("memberEmail", memberEmail);
		
		return "member/send-mail";
	}
	
	
	// 메일발송 페이지로 가서 메일을 전송할 경우(회원 email을 직접 입력)
	@RequestMapping(value = "/email", method = RequestMethod.GET)
	// @RequestParam
	public String sendMail(@AuthUser CeoVo authUser) {
		return "member/send-mail";
	}
	
	@RequestMapping(value="/send-mail-success")
	public String sendEmailSuccess() {
		
		return "member/send-mail-success";
	}
	
	@RequestMapping(value="/board", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardList(@AuthUser CeoVo authUser, Model model,
			@RequestParam(value="p", required=true, defaultValue="1") int page,
			@RequestParam(value="kwd", required=true, defaultValue="") String keyword,
			@RequestParam(value="op", required=true, defaultValue="") String option) {
		
		Map<String, Object> map = memberService.boardList(authUser.getId(), page, keyword, option);
		
		model.addAttribute("map", map);
		
		return "member/board";
	}
	
	@RequestMapping(value="/board/reply/{no}")
	public String reply(@AuthUser CeoVo authUser,
			@PathVariable("no") int no, Model model) {

		model.addAttribute("no", no);
		
		return "member/board-write";
	}
	
	@RequestMapping(value="board/view/{no}")
	public String boardView(@AuthUser CeoVo authUser,@PathVariable("no") int no, Model model) throws IOException {
		
		BoardVo boardVo = memberService.findBoardByNo(authUser.getId(), no);
		String name = memberService.findNameByNo(authUser.getId(), no);
		boardVo.setName(name);
		
		System.out.println(boardVo.getContents1());
		String viewer = "quill2.setContents([ " + 
                boardVo.getContents1() +
       "]);";
		
		model.addAttribute("boardVo", boardVo);
		model.addAttribute("viewer", viewer);		// 회원이 작성한 글
		
		// 답글이 있는 경우 
		if(boardVo.isReplyState()) {
			ReplyVo replyVo = memberService.findReplyByParentsNo(authUser.getId(), no);
			String reply = "quill3.setContents([ " + 
			                          replyVo.getContents1() +
			                 "]);";
			
			model.addAttribute("reply", reply);	
			model.addAttribute("replyVo", replyVo);	 // 관리자가 작성한 답글
		}
		
		return "member/board-view";
	}
	
	
}
