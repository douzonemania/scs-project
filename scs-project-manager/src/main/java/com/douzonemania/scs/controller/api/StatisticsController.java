package com.douzonemania.scs.controller.api;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.douzonemania.scs.dto.JsonResult;
import com.douzonemania.scs.service.StatisticsService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.security.AuthUser;

@RestController("StatisticsApiController")
@RequestMapping("/{id}/api/statistics")
public class StatisticsController {

	@Autowired
	private StatisticsService statisticsService;
	
	@ResponseBody
	@GetMapping("/category")
	public JsonResult statistcistCategoryList(
			@AuthUser CeoVo authUser,
			@RequestParam(value="startDate", required=true, defaultValue="") String startDate,
			@RequestParam(value="endDate", required=true, defaultValue="") String endDate,
			Model model) {
		
		String id = authUser.getId();
		Map<String, Object> map = statisticsService.categoryGraphByDate(startDate, endDate, id);
		
		
		
		return JsonResult.success(map);
	}
	
	@ResponseBody
	@GetMapping("/products")
	public JsonResult statistcistProductsList(
			@AuthUser CeoVo authUser,
			@RequestParam(value="startDate", required=true, defaultValue="") String startDate,
			@RequestParam(value="endDate", required=true, defaultValue="") String endDate,
			Model model) {
		
		
		return JsonResult.success("");
	}
}
