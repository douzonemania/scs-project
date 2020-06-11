package com.douzonemania.scs.controller.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.douzonemania.scs.vo.ceo.SubMenuVo;
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
	public JsonResult insertDesign(@RequestBody String map ,@AuthUser CeoVo ceoVo) {
		System.out.println("test");
		System.out.println(map);
		
		//designService.setDesign(map,ceoVo.getId());
		
		return JsonResult.success("");
	}
	
	@ResponseBody
	@RequestMapping("/customMenu/insert")
	public JsonResult insertCustomMenu(@AuthUser CeoVo authUser, 
						@RequestBody String jsonData) {

		JSONObject obj = new JSONObject(jsonData);

		int menuIndex = obj.getInt("menuIndex");
		String name = obj.getString("name");
	
		Boolean insertSuccess = designService.insertCustomMenu(menuIndex, name, authUser.getId());
		
		return JsonResult.success(insertSuccess);
	}
	 
	@ResponseBody
	@RequestMapping("/subMenu/get")
	public JsonResult insertCustomMenu(@AuthUser CeoVo authUser) {
		
		List<SubMenuVo> subMenuList = designService.getSubMenuById(authUser.getId());
		int maxMenuIndex = designService.getMaxSubMenuIndex(authUser.getId());
		
		Map<String, Object> map = new HashMap<>();
		map.put("subMenuList", subMenuList);
		map.put("maxMenuIndex", maxMenuIndex);

		
		return JsonResult.success(map);
	}
			
}
