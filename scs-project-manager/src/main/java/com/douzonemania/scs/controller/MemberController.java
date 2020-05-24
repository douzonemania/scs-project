package com.douzonemania.scs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.douzonemania.scs.service.MemberService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.member.MemberVo;
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

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String memberList(@AuthUser CeoVo authUser, Model model) {
//		List<MemberVo> memberList = memberService.memberList(authUser.getId());
//		for (MemberVo vo : memberList) {
//			System.out.println("~~~~~~~~"+vo);
//		}
//		model.addAttribute("memberList", memberList);
		
		return "member/list";
	}
	
	
	// list에서 메일 발송 버튼을 눌러 전송할 경우(회원 email정보를 받아와야함)
	@RequestMapping(value = "/email/{no}")
	public String sendMemberEmail(@PathVariable("no") int no,
					@AuthUser CeoVo authUser, Model model) {
		
		String memberEmail = memberService.getMemberEmail(authUser.getId(), no);

		model.addAttribute("memberEmail", memberEmail);
		
		return "member/send-mail";
	}
	
//	// 메일발송 페이지로 가서 메일을 전송할 경우(회원 email을 직접 입력)
//	@RequestMapping(value = "/email", method = RequestMethod.GET)
//	public String sendMail(@AuthUser CeoVo authUser, @RequestParam() {
////		memberService.gmailSend();
//		return "member/send-mail";
//	}
	
}
