package com.douzonemania.scs.controller.api;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.douzonemania.scs.dto.JsonResult;
import com.douzonemania.scs.service.DesignService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.ceo.CustomDesignVo;
import com.douzonemania.scs.vo.ceo.MainMenuVo;
import com.douzonemania.security.AuthUser;

@Controller("DesignApiController")
@RequestMapping("/{db}/api/design")
public class DesignController {

	@Autowired
	DesignService designService;
	
	@ResponseBody
	@RequestMapping("/mainMenu/insert")
	public JsonResult mainMenuList(@AuthUser CeoVo ceoVo, 
			@RequestBody MainMenuVo mainMenuVo) {
		
		boolean insertSuccess = designService.insertMainMenu(ceoVo.getId(), mainMenuVo);
		System.out.println("MAINMENU:" + mainMenuVo);
		return JsonResult.success(insertSuccess);
	}

	@ResponseBody
	@RequestMapping("/mainMenu/get")
	public JsonResult mainMenuPull(@AuthUser CeoVo ceoVo) {
		
		MainMenuVo vo = designService.getMainMenuList(ceoVo.getId());
		System.out.println("OBJECT MAIN MENU:" + vo);
		
		return JsonResult.success(vo);
	}
	
	@ResponseBody
	@RequestMapping("/saveImg")
	public JsonResult saveImg(@RequestParam("file") MultipartFile excelFile) {
		
		String url="/scs-manager"+designService.restore(excelFile);
		
		System.out.println(url);
		return JsonResult.success(url);
	}
	
	@ResponseBody
	@RequestMapping("/insertDesign")
	public JsonResult insertDesign(@RequestBody String map ) {
		
		System.out.println(map);
		
		List<CustomDesignVo> list = new ArrayList<CustomDesignVo>();
		
		JSONObject jObject = new JSONObject(map);
		JSONArray jArray = jObject.getJSONArray("form");
		
		for(int i=0;i<jArray.length()-1;i++) {
			//파싱
			JSONObject obj =jArray.getJSONObject(i);
			CustomDesignVo vo = new CustomDesignVo();
			
			vo.setCustomIndex(obj.getInt("id"));
			vo.setDesignID(obj.getString("element"));
			//cusotm insert -> no -> insert
			
			vo.setContentsGroup(obj.getJSONObject("elementData"));
			System.out.println(vo.toString());
			list.add(vo);
		}
		
		return JsonResult.success("");
	}
}
