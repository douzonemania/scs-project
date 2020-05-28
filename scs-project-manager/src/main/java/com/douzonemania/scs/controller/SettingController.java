package com.douzonemania.scs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.douzonemania.scs.service.SettingService;
import com.douzonemania.scs.service.UserService;
import com.douzonemania.scs.vo.ceo.AgreementVo;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.ceo.ShipCompanyVo;
import com.douzonemania.security.AuthUser;

@Controller
@RequestMapping("/{id:(?!assets).*}/setting")
public class SettingController {

	
	@Autowired
	private SettingService settingService;

	@Autowired
	private UserService userService;

	// setting-basic
	@RequestMapping(value = "/basic", method = RequestMethod.GET)
	public String info(@ModelAttribute("ceoVo") CeoVo ceoVo,
			@AuthUser CeoVo authUser,
			Model model) {
		
		System.out.println("info보여준다.");
		ceoVo = userService.findCeoByIdJoin(authUser.getId());
		model.addAttribute("ceoVo", ceoVo);
		
		return "setting/basic";
	}

	// setting-basic update(get)
	@RequestMapping(value = "/basic/update", method = RequestMethod.GET)
	public String update(@ModelAttribute("ceoVo") CeoVo ceoVo,
			@AuthUser CeoVo authUser,
			Model model) {
		System.out.println("update get 보여준다.");
		ceoVo.setId(authUser.getId());
		
		model.addAttribute("ceoVo", ceoVo);
		
		return "setting/basic";
	}

	// setting-basic update(post)
	@RequestMapping(value = "/basic/update", method = RequestMethod.POST)
	public String update(@ModelAttribute("ceoVo") CeoVo ceoVo,
			@AuthUser CeoVo authUser,
			@RequestParam(value="logo-file") MultipartFile multipartFile1,
			@RequestParam(value="favicon-file") MultipartFile multipartFile2,
			Model model) {
		
		System.out.println("update보여준다.");
		String logo = settingService.restore(ceoVo,multipartFile1);
		ceoVo.setLogo(logo);
		String favicon = settingService.restore(ceoVo,multipartFile2);
		ceoVo.setFavicon(favicon);
		settingService.updateCeo(ceoVo);
		
		model.addAttribute("ceoVo", ceoVo);

		return "setting/basic";
	}

	// setting-policy
	@RequestMapping(value = "/policy", method = RequestMethod.GET)
	public String reg(
			@AuthUser CeoVo authUser,
			@PathVariable String id,
			@ModelAttribute AgreementVo agreementVo,
			Model model) {
		
		System.out.println("policy보여준다.");
		agreementVo.setId(authUser.getId());
		agreementVo = settingService.findAgreementById(authUser.getId());	//authUser 처리
		System.out.println("--------------------------" + 	agreementVo);
		model.addAttribute("agreementVo", agreementVo);

		
		return "setting/policy";
	}
	
	// setting-policy update
	@RequestMapping(value = "/policy/update", method = RequestMethod.POST)
	public String updatePolicy(
			@AuthUser CeoVo authUser,
			@RequestBody String html,
			@ModelAttribute AgreementVo agreementVo,
			Model model) {
			
		System.out.println("policy(update)보여준다.");
		agreementVo.setId(authUser.getId());
		settingService.updatePolicy(html, authUser.getId(), 1);
		model.addAttribute("agreementVo",agreementVo);
		
		return "setting/policy";
	}

	// 배송사 리스트
	@RequestMapping(value = "/shipAdd", method = RequestMethod.GET)
	public String shipList(@ModelAttribute ShipCompanyVo shipCompanyVo,
			@AuthUser CeoVo authUser,
			 Model model) {

		shipCompanyVo.setId(authUser.getId()); // authUser처리
		List<ShipCompanyVo> shipCompanylist = settingService.getShipList(shipCompanyVo.getId());
		model.addAttribute("shipCompanylist", shipCompanylist);

		return "setting/shipAdd";
	}

	// 배송사 추가
	@RequestMapping(value = "/shipAdd/add", method = RequestMethod.POST)
	public String shipListInsert(@AuthUser CeoVo authUser,
			@RequestParam(value = "name") String name, Model model) {

		ShipCompanyVo shipCompanyVo = new ShipCompanyVo();
		shipCompanyVo.setId(authUser.getId()); // authUser 처리
		shipCompanyVo.setName(name);
		settingService.insertShip(shipCompanyVo);

		return "redirect:/"+authUser.getId()+"/setting/shipAdd"; // 경로 id추가

	}

	// 배송사 삭제
	@RequestMapping(value = "/shipAdd/delete/{no }", method = RequestMethod.GET)
	public String shipListDelete(
			@AuthUser CeoVo authUser,
			@PathVariable("no") Long no, @ModelAttribute ShipCompanyVo shipCompanyVo) {

		int count = settingService.shipCount(authUser.getId()); // authUser 처리
		if (count > 1) {
			settingService.deleteShip(no);
		}
		return "redirect:/"+authUser.getId()+"/setting/shipAdd"; // 경로 id추가
	}
}