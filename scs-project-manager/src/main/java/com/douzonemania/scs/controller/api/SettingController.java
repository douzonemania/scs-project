package com.douzonemania.scs.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	/* basic ajax 배송사 리스트 */
	@GetMapping("/shipAdd")
	public JsonResult shipList(
			@AuthUser CeoVo authUser,
			@ModelAttribute ShipCompanyVo shipCompanyVo){
			shipCompanyVo.setId(authUser.getId());	// authUser처리
			List<ShipCompanyVo> shipCompanylist = settingService.getShipList(shipCompanyVo.getId());
		
		return JsonResult.success(shipCompanylist);
	}
	
	/* basic ajax 배송사 추가 */
	@PostMapping("/shipAdd/add")
	public JsonResult shipListAdd(
			@AuthUser CeoVo authUser,
			@RequestBody ShipCompanyVo shipCompanyVo){
		
			List<ShipCompanyVo> shipCompanylist = settingService.getShipList(shipCompanyVo.getId());
			for(ShipCompanyVo vo : shipCompanylist) {
				if(shipCompanyVo.getName().equals(vo.getName())) {
					shipCompanyVo.setNo(vo.getNo());
				}
			}
			settingService.insertShip(shipCompanyVo);
		return JsonResult.success(shipCompanyVo);
	}
	
	/* basic ajax 배송사 삭제 */
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
	
	/* policy ajax 약관 리스트 */
	@GetMapping("/policy")
	public JsonResult policy(
			@AuthUser CeoVo authUser,
			@ModelAttribute AgreementVo agreementVo,
			Model model) {
			
			agreementVo.setId(authUser.getId());
			agreementVo = settingService.findAgreementById(authUser.getId());
			
		return JsonResult.success(agreementVo);
	}
	
	/* policy ajax 약관 리스트 업데이트*/
	@PostMapping("/policy/update")
	public JsonResult policyUpdate(
			@AuthUser CeoVo authUser,
			@RequestBody String html,
			@ModelAttribute AgreementVo agreementVo) {

			agreementVo.setId(authUser.getId());
			agreementVo = settingService.findAgreementById(authUser.getId());
			settingService.updatePolicy(html, agreementVo.getId());
			
		return JsonResult.success(agreementVo);
	}
	
	
}