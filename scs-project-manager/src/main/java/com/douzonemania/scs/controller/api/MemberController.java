package com.douzonemania.scs.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.douzonemania.scs.dto.JsonResult;
import com.douzonemania.scs.service.MemberService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.security.AuthUser;

@RestController("MemberApiController")
@RequestMapping("/{id}/api/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	
	@ResponseBody
	@RequestMapping(value = "/email/post", method=RequestMethod.POST)
	public JsonResult sendEmail(@AuthUser CeoVo authUser, @RequestBody String html) {
		
		boolean mailResult = memberService.sendEmail(html);
		
		return JsonResult.success(mailResult);
	}
	
	@ResponseBody
	@RequestMapping(value="/delete/{no}")
	public JsonResult deleteMember(@AuthUser CeoVo authUser,
				@PathVariable("no") int no) {
		
		boolean deleteResult = memberService.deleteMember(authUser.getId(), no);
		
		return JsonResult.success(deleteResult);
	}
	
	@ResponseBody
	@RequestMapping(value="/board/delete/{no}")
	public JsonResult deleteBoard(@AuthUser CeoVo authUser, @PathVariable int no) {
		
		boolean deleteResult = memberService.deleteBoard(authUser.getId(), no);
		
		return JsonResult.success(deleteResult);
	}
	
	@ResponseBody
	@RequestMapping(value="/board/write/{no}", method=RequestMethod.POST)
	public JsonResult boardWrite(@AuthUser CeoVo authUser,
			@PathVariable("no") int no, @RequestBody String html) {
		
		boolean replyResult = memberService.boardReply(authUser.getId(), no, html);
		memberService.setBoardReplyTrue(authUser.getId(), no);
		
		return JsonResult.success(replyResult);
	}
}
