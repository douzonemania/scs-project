package com.douzonemania.scs.controller;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzonemania.scs.service.ProductService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.ceo.ShipCompanyVo;
import com.douzonemania.scs.vo.member.CategoryVo;
import com.douzonemania.scs.vo.member.ItemVo;
import com.douzonemania.scs.vo.member.OptionVo;
import com.douzonemania.security.AuthUser;

@Controller
@RequestMapping("/{id:(?!assets).*}/product")

public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	// product-info 상품 리스트 뿌리기
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info(
			Model model,
			@AuthUser CeoVo authUser) {
		String id = authUser.getId();
		List<ItemVo> itemList = productService.getItemList(id);
		
		List<String> salePriceList = new ArrayList<>();
		for (ItemVo vo : itemList) {
			String price = NumberFormat.getInstance().format( ((int)((double)vo.getNowPrice() * (1 - ((double)vo.getSale() / 100)))+5)/10*10   )+"원";
			salePriceList.add(price);
		}
		
		model.addAttribute("salePriceList", salePriceList);
		model.addAttribute("itemList", itemList);		
		
		return "product/info";
	}
	
	@RequestMapping(value = "/reg", method = RequestMethod.GET)
	public String reg(
			Model model,
			@AuthUser CeoVo authUser) {
		String id = authUser.getId();
		List<CategoryVo> categoryNameList = productService.getCategoryNameList(id);
		List<OptionVo> sizeOptionList = productService.getOptionListOfSize(id);
		List<OptionVo> colorOptionList = productService.getOptionListOfColor(id);
		List<ShipCompanyVo> shipCompanyList = productService.getShipCompanyList(id);
		
		model.addAttribute("categoryNameList",categoryNameList);	// 카테고리 리스트
		model.addAttribute("sizeOptionList", sizeOptionList);		// 사이즈 리스트
		model.addAttribute("colorOptionList", colorOptionList);		// 컬러 리스트
		model.addAttribute("shipCompanyList", shipCompanyList);		// 배송사 리스트
		return "product/reg";
	}



	@RequestMapping(value = "/modify-item/{vo.no}")
	public String modifyItem(
			@AuthUser CeoVo authUser,
			@PathVariable("vo.no") int no,
			Model model
			) {
		String id = authUser.getId();
		ItemVo vo = new ItemVo();
		vo = productService.findItem(id, no);
		CategoryVo cVo = productService.findCategoryByNo(id, vo.getCategoryNo());
		List<CategoryVo> categoryNameList = productService.getCategoryNameList(id);
		List<OptionVo> sizeOptionList = productService.getOptionListOfSize(id);
		List<OptionVo> colorOptionList = productService.getOptionListOfColor(id);
		List<CategoryVo> category2NameList = productService.getCategory2NameList(id, cVo.getParentNo());
		List<ShipCompanyVo> shipCompanyList = productService.getShipCompanyList(id);
		
		model.addAttribute("vo",vo);	//	아이템정보
		model.addAttribute("cVo",cVo);	//	카테고리정보
		model.addAttribute("categoryNameList",categoryNameList);	//카테고리리스트
		model.addAttribute("category2NameList", category2NameList);	//2차카테고리리스트
		model.addAttribute("sizeOptionList", sizeOptionList);		//사이즈옵션리스트
		model.addAttribute("colorOptionList", colorOptionList);		//컬러옵션리스트
		model.addAttribute("shipCompanyList", shipCompanyList);		//배송사 리스트
		
		return "product/item-mod";
	}
	
	@RequestMapping(value = "/category-reg", method = RequestMethod.GET)
	public String categoryReg(
			@AuthUser CeoVo authUser,
			Model model) {
		String id = authUser.getId();
		List<CategoryVo> categoryNameList = productService.getCategoryNameList(id);
		List<CategoryVo> category2NameList = productService.getCategory2NameList(id);
		
		model.addAttribute("categoryNameList", categoryNameList);
		model.addAttribute("category2NameList", category2NameList);

		return "product/category-reg";
	}
	
	@RequestMapping(value = "/category-reg/add", method = RequestMethod.POST)
	public String addCategory(
			@AuthUser CeoVo authUser,
			@RequestParam(value= "category-name", defaultValue="true") String categoryName
			) {
		String id = authUser.getId();
		return "product/category-reg";
	}
	
	@RequestMapping(value = "/optionAdd", method = RequestMethod.GET)
	public String optionList(
			@AuthUser CeoVo authUser,
			Model model) {				
		String id = authUser.getId();
	
		List<OptionVo> sizeOptionList = productService.getOptionListOfSize(id);
		List<OptionVo> colorOptionList = productService.getOptionListOfColor(id);
		
		model.addAttribute("sizeOptionList", sizeOptionList);
		model.addAttribute("colorOptionList", colorOptionList);

		return "product/optionAdd";
	}
	

}
