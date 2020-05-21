package com.douzonemania.scs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.douzonemania.scs.service.SettingService;
import com.douzonemania.scs.service.ShipCompanyService;
import com.douzonemania.scs.service.UserService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.ceo.ShipCompanyVo;

@Controller
@RequestMapping("/{id:(?!assets).*}/setting")
public class SettingController {

	@Autowired
	private ShipCompanyService shipCompanyService;

	@Autowired
	private SettingService settingService;

	@Autowired
	private UserService userService;

	// setting-basic
	@RequestMapping(value = "/basic", method = RequestMethod.GET)
	public String info(@ModelAttribute CeoVo ceoVo,
			Model model) {
		System.out.println("info보여준다.");

		ceoVo = userService.findCeoByIdJoin("sjy8033");
		
		System.out.println("--------------------" + ceoVo);

		model.addAttribute("ceoVo", ceoVo);
		
		return "setting/basic";
	}

	// setting-basic update(get)
	@RequestMapping(value = "/basic/update", method = RequestMethod.GET)
	public String update(@ModelAttribute CeoVo ceoVo, Model model) {
		System.out.println("update get 보여준다.");

		model.addAttribute("ceoVo", ceoVo);
		
		return "setting/basic";
	}

	// setting-basic update(post)
	@RequestMapping(value = "/basic/update", method = RequestMethod.POST)
	public String update(
			@ModelAttribute CeoVo ceoVo,
			BindingResult result,
			@RequestParam(value="logo-file") MultipartFile multipartFile1,
			@RequestParam(value="favicon-file") MultipartFile multipartFile2,
			Model model) {
		System.out.println("update보여준다.");
		
		// model.addAllAttributes(result.getModel());
		
		String logo = settingService.restore(ceoVo,multipartFile1);
		ceoVo.setLogo(logo);
		String favicon = settingService.restore(ceoVo,multipartFile2);
		ceoVo.setFavicon(favicon);
		
		settingService.updateCeo(ceoVo);
		
		System.out.println(ceoVo);
//		model.addAttribute("logo", logo);
//		model.addAttribute("favicon", favicon);
		model.addAttribute("ceoVo", ceoVo);

		return "setting/basic";
	}

	// setting-policy
	@RequestMapping(value = "/policy", method = RequestMethod.GET)
	public String reg() {
		return "setting/policy";
	}

	// 배송사 리스트
	@RequestMapping(value = "/shipAdd", method = RequestMethod.GET)
	public String shipList(
//			@AuthUser CeoVo authUser,
			@ModelAttribute ShipCompanyVo shipCompanyVo, Model model) {

		shipCompanyVo.setId("sjy8033"); // authUser처리
		List<ShipCompanyVo> shipCompanylist = shipCompanyService.getShipList(shipCompanyVo.getId());
		model.addAttribute("shipCompanylist", shipCompanylist);

		return "setting/shipAdd";
	}

	// 배송사 추가
	@RequestMapping(value = "/shipAdd/add", method = RequestMethod.POST)
	public String shipListInsert(
//			@PathVariable String id,
//			@AuthUser CeoVo authUser,
			@RequestParam(value = "name") String name, Model model) {

		ShipCompanyVo shipCompanyVo = new ShipCompanyVo();
		shipCompanyVo.setId("sjy8033"); // authUser 처리
		shipCompanyVo.setName(name);
		shipCompanyService.insertShip(shipCompanyVo);

		return "redirect:/{id}/setting/shipAdd"; // 경로 id추가

	}

	// 배송사 삭제
	@RequestMapping(value = "/shipAdd/delete/{no }", method = RequestMethod.GET)
	public String shipListDelete(
//			@PathVariable String id,
			@PathVariable("no") Long no, @ModelAttribute ShipCompanyVo shipCompanyVo) {

		int count = shipCompanyService.shipCount("sjy8033"); // authUser 처리
		if (count > 1) {
			shipCompanyService.deleteShip(no);
		}
		return "redirect:/{id}setting/shipAdd"; // 경로 id추가
	}
}
