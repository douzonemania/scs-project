package com.douzonemania.scs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzonemania.scs.service.ShipCompanyService;
import com.douzonemania.scs.vo.ceo.ShipCompanyVo;

@Controller
@RequestMapping("/setting")
public class SettingController {

	@Autowired
	private ShipCompanyService shipCompanyService;
	
	@RequestMapping(value = "/basic", method = RequestMethod.GET)
	public String info() {
		return "setting/basic";
	}

	@RequestMapping(value = "/policy", method = RequestMethod.GET)
	public String reg() {
		return "setting/policy";
	}
	
	@RequestMapping(value = "/shipAdd", method=RequestMethod.GET )
	public String shipList(
//			@AuthUser CeoVo authUser,
			@ModelAttribute ShipCompanyVo shipCompanyVo,
			Model model) {
			
			shipCompanyVo.setId("sjy8033");	//authUser처리
			List<ShipCompanyVo> shipCompanylist = shipCompanyService.getShipList(shipCompanyVo.getId());
			model.addAttribute("shipCompanylist",shipCompanylist);
			
		return "setting/shipAdd";
	}
	
	@RequestMapping(value="/shipAdd/add",method = RequestMethod.POST)
	public String shipListInsert(
//			@PathVariable String id,
//			@AuthUser CeoVo authUser,
			@RequestParam(value="name") String name,
			Model model) {
			
			ShipCompanyVo shipCompanyVo = new ShipCompanyVo();
			shipCompanyVo.setId("sjy8033");	//authUser 처리
			shipCompanyVo.setName(name);
			shipCompanyService.insertShip(shipCompanyVo);
		
			return "redirect:/setting/shipAdd";		//경로 id추가
			
	}
	
	@RequestMapping(value="/shipAdd/delete/{no }",method = RequestMethod.GET)
	public String shipListDelete(
//			@PathVariable String id,
			@PathVariable("no") Long no,
			@ModelAttribute ShipCompanyVo shipCompanyVo) {
			
			System.out.println("contrrolleerrr");
			int count = shipCompanyService.shipCount("sjy8033");	//authUser 처리
			if(count > 1) {
				shipCompanyService.deleteShip(no);
			}
			return "redirect:/setting/shipAdd";	// 경로 id추가
	}
}
