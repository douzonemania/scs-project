package com.douzonemania.scs.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.douzonemania.scs.dto.JsonResult;
import com.douzonemania.scs.service.ProductService;
import com.douzonemania.scs.vo.member.CategoryVo;


@RestController("ProductApiController")
@RequestMapping("/api/product")
public class productController {

	@Autowired
	ProductService productService;
	
	// 카테고리 등록
	@ResponseBody	
	@RequestMapping(value="/category-reg/add", method = RequestMethod.POST)
	public JsonResult categoryAdd(			
			@RequestBody CategoryVo cVo			
			){		
		if ( productService.findCategoryByName(cVo.getName()) == null ) // 카테고리 이름 중복 방지
			productService.addCategory(cVo);
		else
			System.err.println("중복된 카테고리 명입니다.");
			
		return JsonResult.success(cVo);
	}
	
	// 카테고리 삭제
	@RequestMapping(value="/category-reg/del", method = RequestMethod.POST)
	public JsonResult categoryDelete(
			@RequestBody CategoryVo cVo
			) {
			productService.delCategory(cVo.getName());
		return JsonResult.success(cVo);
	}
	
	// 카테고리 수정
	@RequestMapping(value="/category-reg/mod/{afterName}", method = RequestMethod.POST)
	public JsonResult categoryUpdate(
			@RequestBody CategoryVo cVo,
			@PathVariable(value = "afterName") String afterName
			) {
			productService.updateCategory(cVo.getName(),afterName);
		return JsonResult.success(cVo);
	}
}