package com.douzonemania.scs.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.douzonemania.scs.dto.JsonResult;
import com.douzonemania.scs.service.DesignService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.ceo.ContentsVo;
import com.douzonemania.scs.vo.ceo.CustomVo;
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

		return JsonResult.success(insertSuccess);
	}

	@ResponseBody
	@RequestMapping("/mainMenu/get")
	public JsonResult getMainMenu(@AuthUser CeoVo ceoVo) {
		
		MainMenuVo vo = designService.getMainMenuList(ceoVo.getId());
		
		return JsonResult.success(vo);
	}
	
	@ResponseBody
	@RequestMapping("/saveImg")
	public JsonResult saveImg(@RequestParam("file") MultipartFile excelFile) {
		
		String url="/scs-manager"+designService.restore(excelFile);
		
		return JsonResult.success(url);
	}
	
	@ResponseBody
	@RequestMapping("/insertDesign")
	public JsonResult insertDesign(@RequestBody String map ,@AuthUser CeoVo ceoVo) {
		
		designService.setDesign(map,ceoVo.getId());
		
		return JsonResult.success("");
	}
	
	@ResponseBody
	@RequestMapping("/customMenu/insert")
	public JsonResult insertCustomMenu(@AuthUser CeoVo authUser, 
						@RequestBody String jsonData) {

		JSONObject obj = new JSONObject(jsonData);

		int menuIndex = obj.getInt("menuIndex");
		String name = obj.getString("name");
	
		Boolean check = designService.insertCustomMenu(menuIndex, name, authUser.getId());
		
		if(check) {
			List<SubMenuVo> subMenuList = designService.getSubMenuById(authUser.getId());
			int maxMenuIndex = designService.getMaxSubMenuIndex(authUser.getId());
			
			Map<String, Object> map = new HashMap<>();
			map.put("subMenuList", subMenuList);
			map.put("maxMenuIndex", maxMenuIndex);
			
			return JsonResult.success(map);
		} else {
			return JsonResult.success(false);
		}
		
	}
	
	@ResponseBody
	@RequestMapping("/customMenu/delete/{index}")
	public JsonResult deleteCustomMenu(@AuthUser CeoVo authUser, @PathVariable int index) {
	
		Boolean check = designService.deleteCustomMenu(authUser.getId(), index);
		
		if(check) {
			List<SubMenuVo> subMenuList = designService.getSubMenuById(authUser.getId());
			int maxMenuIndex = designService.getMaxSubMenuIndex(authUser.getId());
			
			Map<String, Object> map = new HashMap<>();
			map.put("subMenuList", subMenuList);
			map.put("maxMenuIndex", maxMenuIndex);
			
			return JsonResult.success(map);
		} else {
			return JsonResult.success(false);
		}
		
	}
	 
	@ResponseBody
	@RequestMapping("/subMenu/get")
	public JsonResult getCustomMenu(@AuthUser CeoVo authUser) {
		
		List<SubMenuVo> subMenuList = designService.getSubMenuById(authUser.getId());
		int maxMenuIndex = designService.getMaxSubMenuIndex(authUser.getId());
		
		Map<String, Object> map = new HashMap<>();
		map.put("subMenuList", subMenuList);
		map.put("maxMenuIndex", maxMenuIndex);
		
		return JsonResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping("/FAQ/insert")
	public JsonResult insertFAQ(@AuthUser CeoVo authUser, @RequestBody String map) {
		
		boolean insertSuccess = designService.insertFQA(authUser.getId(), map);
		
		return JsonResult.success(insertSuccess);
	}
	
	@ResponseBody
	@RequestMapping("/FAQ/get")
	public JsonResult getFAQ(@AuthUser CeoVo authUser) {
		
		// 2: FAQ의 index
		int menuNo = designService.findSubmenuNum(2, authUser.getId());
		
		List<CustomVo> customList = designService.getCustomBySubmenuNo(menuNo, authUser.getId());
		CustomVo vo = customList.get(0);

		List<ContentsVo> contentsList = designService.getContentsByCustomNo(vo.getNo(), authUser.getId());
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", contentsList);
		
		return JsonResult.success(map);
	}
	
			
}
