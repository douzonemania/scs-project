package com.douzonemania.scs.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.douzonemania.scs.vo.ceo.ShipCompanyVo;

@RestController("SettingApiController")
@RequestMapping("/{id}/api/setting")
public class SettingController {
	
	@Autowired
	private SettingService settingService;
	
	@GetMapping("/shipAdd")
	public JsonResult shipList(
			// @AuthUser CeoVo authUser,
			@ModelAttribute ShipCompanyVo shipCompanyVo){
			shipCompanyVo.setId("sjy8033");	// authUser처리
			List<ShipCompanyVo> shipCompanylist = settingService.getShipList(shipCompanyVo.getId());
		
		return JsonResult.success(shipCompanylist);
	}
	
	@PostMapping("/shipAdd/add")
	public JsonResult shipListAdd(
			// @PathVariable String id
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
//			@PathVariable String id,
			@PathVariable("no") Long no) {
			
			boolean result = false;
			int count = settingService.shipCount("sjy8033");	//authUser처리
			if(count > 1) {
				result = settingService.deleteShip(no);
			}
			return JsonResult.success(result? no : -1);
	}
}