package com.douzonemania.scs.controller.api;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.douzonemania.scs.dto.JsonResult;
import com.douzonemania.scs.service.StatisticsService;
import com.douzonemania.scs.vo.ceo.CategoryBarVo;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.security.AuthUser;

@RestController("StatisticsApiController")
@RequestMapping("/{id}/api/statistics")
public class StatisticsController {

	@Autowired
	private StatisticsService statisticsService;
	
	@ResponseBody
	@PostMapping("/category/{startDate}/{endDate}")
	public JsonResult statistcistCategoryList(
			@AuthUser CeoVo authUser,
			@PathVariable String startDate,
			@PathVariable String endDate,
			Model model) {
		
		/* 지정된 날짜 */
		String id = authUser.getId();
		CategoryBarVo tempVo = new CategoryBarVo();
		String [] temp  = endDate.split("-");
		int year = Integer.parseInt(temp[0]);
		int month = Integer.parseInt(temp[1]);
		int day = Integer.parseInt(temp[2]);
		tempVo.setDate(get7DayAgoDate(year, month, day, 7));
		String realStartDate = tempVo.getDate();
		
		Map<String, Object> map = statisticsService.categoryGraphByDate(realStartDate, endDate, id, false);
		
		return JsonResult.success(map);
	}
	
	@ResponseBody
	@PostMapping("/products/{startDate}/{endDate}")
	public JsonResult statistcistProductsList(
			@AuthUser CeoVo authUser,
			@PathVariable String startDate,
			@PathVariable String endDate,
			Model model) {
		
		String id = authUser.getId();
		CategoryBarVo tempVo = new CategoryBarVo();
		String [] temp  = endDate.split("-");
		int year = Integer.parseInt(temp[0]);
		int month = Integer.parseInt(temp[1]);
		int day = Integer.parseInt(temp[2]);
		tempVo.setDate(get7DayAgoDate(year, month, day, 7));
		String realStartDate = tempVo.getDate();
	
		Map<String, Object> map = statisticsService.productsGraphByDate(realStartDate, endDate, id, false);
		
		return JsonResult.success(map);
	}
	
	private String get7DayAgoDate(int year , int month , int day, int i) {
		Calendar cal = Calendar
				.getInstance();
		cal.set(year, month-1, day);
		cal.add(Calendar.DATE, -i);
		java.util.Date weekago = cal.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd",
				Locale.getDefault());
		return formatter.format(weekago);
	}
}
