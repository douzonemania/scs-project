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
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.member.CategoryVo;
import com.douzonemania.scs.vo.member.OptionVo;
import com.douzonemania.security.AuthUser;


@RestController("ProductApiController")
@RequestMapping("/api/product")
public class productController {

	@Autowired
	ProductService productService;
	
	// 카테고리 등록
	@ResponseBody	
	@RequestMapping(value="/category-reg/add/{parentCategory}", method = RequestMethod.POST)
	public JsonResult categoryAdd(
			@AuthUser CeoVo authUser,
			@RequestBody CategoryVo cVo,
			@PathVariable(value = "parentCategory") String parentCategory
			){
		String id = authUser.getId();
		if("----".equals(parentCategory)) {
			if ( productService.findCategoryByName(id,cVo.getName()) == null ) { // 카테고리 이름 중복 방지
				productService.addCategory(id, cVo);				
			}
			else 
				System.err.println("중복된 카테고리 명입니다.");
				
			return JsonResult.success(productService.getCategoryNameList(id));
		} else {					
			int parentCategoryNo = productService.getCategoryNoByName(id, parentCategory); // 부모 카테고리 번호
			
			if ( productService.findCategoryByName(id, cVo.getName()) == null ) { // 카테고리 이름 중복 방지
				cVo.setParentNo(parentCategoryNo);
				productService.addCategory(id, cVo);
			}
			else
				System.err.println("중복된 카테고리 명입니다.");
			
			return JsonResult.success(productService.getCategory2NameList(id, parentCategoryNo));	
		}
			
	}
	
	// 카테고리 삭제
	@RequestMapping(value="/category-reg/del", method = RequestMethod.POST)
	public JsonResult categoryDelete(
			@AuthUser CeoVo authUser,
			@RequestBody CategoryVo cVo
			) {
		String id = authUser.getId();	
		productService.delCategory(id, cVo.getName());
		return JsonResult.success(productService.getCategoryNameList(id));
	}
	
	// 카테고리 수정
	@RequestMapping(value="/category-reg/mod/{afterName}", method = RequestMethod.POST)
	public JsonResult categoryUpdate(
			@AuthUser CeoVo authUser,
			@RequestBody CategoryVo cVo,
			@PathVariable(value = "afterName") String afterName
			) {
			String id = authUser.getId();	
			productService.updateCategory(id, cVo.getName(),afterName);
			return JsonResult.success(productService.getCategoryNameList(id));
	}
	
	// 2차카테고리 이름 리스트
	@RequestMapping(value="/category-reg/childCategoryList", method = RequestMethod.POST)
	public JsonResult childcategoryList(
			@AuthUser CeoVo authUser,
			@RequestBody CategoryVo cVo
			) {
			String id = authUser.getId();
			String name = cVo.getName();
			int parentCategoryNo = productService.getCategoryNoByName(id, name);
			
			List<CategoryVo> childCategoryNameList = productService.getCategory2NameList(id, parentCategoryNo);
			
		return JsonResult.success(childCategoryNameList);
	}
	
	// 1차 카테고리이름 테이블
	@RequestMapping(value="/category-reg/createTable", method = RequestMethod.POST)
	public JsonResult createTable1(
			@AuthUser CeoVo authUser,
			@RequestBody CategoryVo cVo			
			) {
		String id = authUser.getId();
		productService.getCategoryNoByName(id, cVo.getName());
		System.err.println(cVo.getName());
		
		return JsonResult.success(productService.getCategoryNoByName(id, cVo.getName()));
	}
	
	// 2차 카테고리이름 테이블 
	@RequestMapping(value="/category-reg/createTable2", method = RequestMethod.POST)
	public JsonResult createTable(
			@AuthUser CeoVo authUser,
			@RequestBody CategoryVo cVo			
			) {
		String id = authUser.getId();
		return JsonResult.success(productService.getCategory2NameList(id, cVo.getParentNo()));
	}
	
	// 사이즈 옵션 추가
	@RequestMapping(value="/option/addSize", method = RequestMethod.POST)
	public JsonResult addSize(
			@AuthUser CeoVo authUser,
			@RequestBody OptionVo oVo			
			) {
		String id = authUser.getId();
		productService.addSizeOption(id, oVo.getName());		// 사이즈 add
		oVo = productService.getOption(id, oVo.getName());		// 옵션 셀렉트
		return JsonResult.success(oVo);
	}
	
	// 컬러 옵션 추가
	@RequestMapping(value="/option/addColor", method = RequestMethod.POST)
	public JsonResult addColor(
			@AuthUser CeoVo authUser,
			@RequestBody OptionVo oVo			
			) {
		String id = authUser.getId();
		productService.addColorOption(id, oVo.getName());		// 컬러 add
		oVo = productService.getOption(id, oVo.getName());		// 옵션 셀렉트
		return JsonResult.success(oVo);
	}
	
	// 옵션 삭제
	@RequestMapping(value="/option/deleteOpiton", method = RequestMethod.POST)
	public JsonResult deleteOption(
			@AuthUser CeoVo authUser,
			@RequestBody OptionVo oVo			
			) {
		String id = authUser.getId();		
		return JsonResult.success(productService.delOption(id, oVo.getNo()));
	}
	// 옵션 추가 팝업
	/*
	 * @RequestMapping(value="/category-reg/addOption", method = RequestMethod.POST)
	 * public JsonResult addOption(
	 * 
	 * @AuthUser CeoVo authUser,
	 * 
	 * @RequestBody CategoryVo cVo ) { String id = authUser.getId(); return
	 * JsonResult.success(productService.getCategory2NameList(id,
	 * cVo.getParentNo())); }
	 */
	

}