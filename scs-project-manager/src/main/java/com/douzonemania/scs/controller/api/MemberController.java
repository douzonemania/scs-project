package com.douzonemania.scs.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.douzonemania.scs.dto.JsonResult;
import com.douzonemania.scs.service.MemberService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.member.MemberVo;
import com.douzonemania.security.AuthUser;

@RestController("MemberApiController")
@RequestMapping("/{id}/api/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public JsonResult list(@AuthUser CeoVo authUser) {
		List<MemberVo> memberList = memberService.memberList(authUser.getId());
		
		return JsonResult.success(memberList);
	}
	
}
