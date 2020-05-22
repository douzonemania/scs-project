package com.douzonemania.scs.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(value="/category-reg/add/{parentCategory}", method = RequestMethod.POST)
	public JsonResult categoryAdd(			
			@RequestBody CategoryVo cVo,
			@PathVariable(value = "parentCategory") String parentCategory
			){
		
		if("----".equals(parentCategory)) {
			if ( productService.findCategoryByName(cVo.getName()) == null ) { // 카테고리 이름 중복 방지
				productService.addCategory(cVo);				
			}
			else 
				System.err.println("중복된 카테고리 명입니다.");
				
			return JsonResult.success(productService.getCategoryNameList());
		} else {					
			int parentCategoryNo = productService.getCategoryNoByName(parentCategory); // 부모 카테고리 번호
			
			if ( productService.findCategoryByName(cVo.getName()) == null ) { // 카테고리 이름 중복 방지
				cVo.setParentNo(parentCategoryNo);
				productService.addCategory(cVo);
			}
			else
				System.err.println("중복된 카테고리 명입니다.");
			
			return JsonResult.success(productService.getCategory2NameList(parentCategoryNo));	
		}
			
	}
	
	// 카테고리 삭제
	@RequestMapping(value="/category-reg/del", method = RequestMethod.POST)
	public JsonResult categoryDelete(
			@RequestBody CategoryVo cVo
			) {
			productService.delCategory(cVo.getName());
			return JsonResult.success(productService.getCategoryNameList());
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
	
	// 2차카테고리 이름 리스트
	@RequestMapping(value="/category-reg/childCategoryList", method = RequestMethod.POST)
	public JsonResult childcategoryList(
			@RequestBody CategoryVo cVo
			) {			
			String name = cVo.getName();
			int parentCategoryNo = productService.getCategoryNoByName(name);
			
			List<CategoryVo> childCategoryNameList = productService.getCategory2NameList(parentCategoryNo);
			
		return JsonResult.success(childCategoryNameList);
	}
	
	// 전체 리스트 테이블
	@RequestMapping(value="/category-reg/createTable", method = RequestMethod.POST)
	public JsonResult createTable(
			@RequestBody CategoryVo cVo			
			) {			
		return JsonResult.success(productService.getCategoryNameList());
	}

}
