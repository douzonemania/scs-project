package com.douzonemania.scs.api;


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
import com.douzonemania.scs.service.ShipCompanyService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.ceo.ShipCompanyVo;

@RestController("SettingApiController")
@RequestMapping("/setting/api")
public class SettingController {
	
	@Autowired
	private ShipCompanyService shipCompanyService;
	
	@GetMapping("/shipAdd")
	public JsonResult shipList(
			// @AuthUser CeoVo authUser,
			@ModelAttribute ShipCompanyVo shipCompanyVo){
			shipCompanyVo.setId("sjy8033");	// authUser처리
			List<ShipCompanyVo> shipCompanylist = shipCompanyService.getShipList(shipCompanyVo.getId());
		
		return JsonResult.success(shipCompanylist);
	}
	
	@PostMapping("/shipAdd/add")
	public JsonResult shipListAdd(
			// @PathVariable String id
			@RequestBody ShipCompanyVo shipCompanyVo){
		
			List<ShipCompanyVo> shipCompanylist = shipCompanyService.getShipList(shipCompanyVo.getId());
			for(ShipCompanyVo vo : shipCompanylist) {
				if(shipCompanyVo.getName().equals(vo.getName())) {
					shipCompanyVo.setNo(vo.getNo());
					System.out.println(shipCompanyVo.getNo());
				}
			}
			shipCompanyService.insertShip(shipCompanyVo);
		return JsonResult.success(shipCompanyVo);
	}
	
	@DeleteMapping("/shipAdd/delete/{no}")
	public JsonResult shipListDelete(
//			@PathVariable String id,
			@PathVariable("no") Long no) {
			
			System.out.println("=========================================" + no);
			
			boolean result = false;
			int count = shipCompanyService.shipCount("sjy8033");	//authUser처리
			if(count > 1) {
				result = shipCompanyService.deleteShip(no);
			}
			return JsonResult.success(result? no : -1);
	}
}
