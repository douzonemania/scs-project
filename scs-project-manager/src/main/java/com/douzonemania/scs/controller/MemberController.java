package com.douzonemania.scs.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzonemania.scs.service.MemberService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.security.AuthUser;

// 회원 관리
@Controller
@RequestMapping("/{id}/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;

	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String memberBoard() {
		return "member/board";
	}

	@RequestMapping(value= {"", "/list"}, method = { RequestMethod.GET, RequestMethod.POST })
	public String memberList(@AuthUser CeoVo authUser, Model model,
			@RequestParam(value="p", required=true, defaultValue="1") int page,
			@RequestParam(value="kwd", required=true, defaultValue="") String keyword,
			@RequestParam(value="op", required=true, defaultValue="") String option) {
		
		Map<String, Object> map = memberService.find(authUser.getId(), page, keyword, option);
		
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
	
//	@RequestMapping(value = "/email/post", method=RequestMethod.POST)
//	public String sendEmail(@AuthUser CeoVo authUser, @RequestParam("memberEmail") String memberEmail,
//			@RequestParam("title") String title, @RequestParam("contents") String contents) {
//		
//		memberService.gmailSend(memberEmail, title, contents);
//		
//		return "member/send-mail-success";
//	}
	
	@ResponseBody
	@RequestMapping(value = "/email/post", method=RequestMethod.POST)
	public String sendEmail(@AuthUser CeoVo authUser, @RequestBody String html) {
		
//		  String email = request.getParameter("memberEmail"); 
//		  String title = request.getParameter("title");
		 
		System.out.println("html:"+html);
		memberService.jsonPassing(html);
		
//		memberService.gmailSend(memberEmail, title, contents);
		
		return "member/send-mail-success";
	}
	
	
	// 메일발송 페이지로 가서 메일을 전송할 경우(회원 email을 직접 입력)
	@RequestMapping(value = "/email", method = RequestMethod.GET)
	// @RequestParam
	public String sendMail(@AuthUser CeoVo authUser) {
//		memberService.gmailSend();
		return "member/send-mail";
	}
	
	@RequestMapping(value="/send-mail-success")
	public String sendEmailSuccess() {
		
		return "member/send-mail-success";
	}
	
}
