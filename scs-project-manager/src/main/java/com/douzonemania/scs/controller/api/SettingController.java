package com.douzonemania.scs.controller.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.douzonemania.scs.dto.JsonResult;
import com.douzonemania.scs.service.SettingService;
import com.douzonemania.scs.vo.ceo.AgreementVo;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.ceo.ShipCompanyVo;
import com.douzonemania.security.AuthUser;

@RestController("SettingApiController")
@RequestMapping("/{id}/api/setting")
public class SettingController {
	
	@Autowired
	private SettingService settingService;
	
	
	@GetMapping("/shipAdd")
	public JsonResult shipList(
			@AuthUser CeoVo authUser,
			@ModelAttribute ShipCompanyVo shipCompanyVo){
			shipCompanyVo.setId(authUser.getId());	// authUser처리
			List<ShipCompanyVo> shipCompanylist = settingService.getShipList(shipCompanyVo.getId());
		
		return JsonResult.success(shipCompanylist);
	}
	
	@PostMapping("/shipAdd/add")
	public JsonResult shipListAdd(
			@AuthUser CeoVo authUser,
			@RequestBody ShipCompanyVo shipCompanyVo){
		
			List<ShipCompanyVo> shipCompanylist = settingService.getShipList(shipCompanyVo.getId());
			for(ShipCompanyVo vo : shipCompanylist) {
				if(shipCompanyVo.getName().equals(vo.getName())) {
					shipCompanyVo.setNo(vo.getNo());
					System.out.println(shipCompanyVo.getNo());
				}
			}
			settingService.insertShip(shipCompanyVo);
		return JsonResult.success(shipCompanyVo);
	}
	
	@DeleteMapping("/shipAdd/delete/{no}")
	public JsonResult shipListDelete(
			@AuthUser CeoVo authUser,
			@PathVariable("no") Long no) {
			
			boolean result = false;
			int count = settingService.shipCount(authUser.getId());	//authUser처리
			if(count > 1) {
				result = settingService.deleteShip(no);
			}
		return JsonResult.success(result? no : -1);
	}
	
	@GetMapping("/policy")
	public JsonResult policy(
			@AuthUser CeoVo authUser,
			@ModelAttribute AgreementVo agreementVo) {
			
			agreementVo.setId(authUser.getId());
			agreementVo = settingService.findAgreementById(authUser.getId());
			
		return JsonResult.success(agreementVo);
	}
	
	@PostMapping("/policy/update")
	public JsonResult policyUpdate(
			@AuthUser CeoVo authUser,
			@RequestBody String html,
			@ModelAttribute AgreementVo agreementVo) {
			
			System.out.println(html);
			
			
			agreementVo.setId(authUser.getId());
			agreementVo = settingService.findAgreementById(authUser.getId());
			settingService.updatePolicy(html, agreementVo.getId(), 1);
			
		return JsonResult.success(agreementVo);
	}
	
	
}