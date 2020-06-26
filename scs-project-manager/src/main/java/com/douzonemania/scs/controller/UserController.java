package com.douzonemania.scs.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.douzonemania.scs.dto.JsonResult;
import com.douzonemania.scs.service.SettingService;
import com.douzonemania.scs.service.UserService;
import com.douzonemania.scs.vo.ceo.AgreementVo;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.ceo.SiteVo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	private SettingService settingService;
	
	// 아이디 중복 검사
	@ResponseBody
	@RequestMapping(value="/checkid", method = RequestMethod.GET)
	public JsonResult checkId(
		@RequestParam(value="id", required=true, defaultValue="") String id) {
		boolean exist = userService.existUser(id);
		return JsonResult.success(exist);
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join(@ModelAttribute CeoVo ceoVo) {
		return "user/signup";
	}
 
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(@ModelAttribute @Valid CeoVo ceoVo, BindingResult result,
			Model model) {

		if(result.hasErrors()) {
			model.addAllAttributes(result.getModel());
			return "user/signup";
		}
		
		if(ceoVo.getAddress1() != null && ceoVo.getAddress2() != null) {
			ceoVo.setAddress(ceoVo.getAddress1() + "!" + ceoVo.getAddress2());
		} else if(ceoVo.getAddress1() != null) {
			ceoVo.setAddress(ceoVo.getAddress1());
		}
		AgreementVo agreementVo = new AgreementVo();
		agreementVo.setId(ceoVo.getId());
		SiteVo siteVo = new SiteVo();
		siteVo.setId(ceoVo.getId());
		userService.insert(ceoVo,agreementVo,siteVo);

		// 회원 DB와 table 생성
		String id = ceoVo.getId();
		userService.createDB(id);
		userService.createTable(id);
		userService.alterTable(id);
		settingService.insertPolicy(id);
		userService.insertShop(id);			// 메인메뉴 1번메뉴에 shop insert
		userService.insertSubMenu(id);		// 서브메뉴 insert
		
		return "user/join-success";
	}
	
	@RequestMapping(value="/join-success")
	public String JoinSuccess() {
		
		return "user/join-success";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	@RequestMapping(value = "/login", method=RequestMethod.POST)
	public String login(@ModelAttribute CeoVo vo, HttpServletResponse response, HttpServletRequest request) throws Exception{
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		CeoVo ceoVo = new CeoVo();
		ceoVo.setId(id);
		ceoVo.setPassword(password);
		
		CeoVo authUser = userService.getUser(ceoVo);
		
		if(authUser == null) {
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = response.getWriter();
			 
			out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
			out.flush();
			System.out.println("NO");
			return "/user/login";
		} else {

			// session 처리
			HttpSession session = request.getSession(true);
			session.setAttribute("authUser", authUser);
			
			System.out.println("LOGIN");
			response.sendRedirect(request.getContextPath()+"/"+authUser.getId() + "/api/user/main");
			
			return "/user/recover";
		}
		
	}

	@RequestMapping(value = "/recover", method = RequestMethod.GET)
	public String recover() {
		return "user/recover";
	}
	
	@ResponseBody
	@RequestMapping(value="/find/id")
	public JsonResult findId(@RequestParam(value="name") String name,
					@RequestParam(value="phoneNum") String phoneNum) {
		
		String id = userService.findIdByNameAndPhone(name, phoneNum);
		
		return JsonResult.success(id);
	}
	
	@ResponseBody
	@RequestMapping(value="/find/password")
	public JsonResult findPassword(@RequestParam(value="id") String id,
					@RequestParam(value="email") String email) {
		
		Boolean sendPassword = userService.sendPasswordEmail(id, email); 
		
		return JsonResult.success(sendPassword);
	}
	
	@RequestMapping(value = "/agreement", method = RequestMethod.GET)
	public String agreement() {

		return "user/agreement";
	}


	@RequestMapping(value="/auth")
	public void auth() {

	}

	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public void logout() {

	}

}
