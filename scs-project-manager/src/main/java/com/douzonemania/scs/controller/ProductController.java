package com.douzonemania.scs.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzonemania.scs.service.ProductService;
import com.douzonemania.scs.vo.member.CategoryVo;
import com.douzonemania.scs.vo.member.ItemVo;

@Controller
@RequestMapping("/{id}/product")

public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	// product-info 상품 리스트 뿌리기
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info(Model model) {
		
		
		List<ItemVo> itemList = productService.getItemList();
		
		List<Integer> salePriceList = new ArrayList<>();
		for (ItemVo vo : itemList) {
			salePriceList.add(vo.getNowPrice() * (1 - (vo.getSale() / 100)));
		}
		
		model.addAttribute("salePriceList", salePriceList);
		model.addAttribute("itemList", itemList);		
		
		return "product/info";
	}
	
	@RequestMapping(value = "/reg", method = RequestMethod.GET)
	public String reg(Model model) {			
		List<CategoryVo> categoryNameList = productService.getCategoryNameList();
		model.addAttribute("categoryNameList",categoryNameList);
		return "product/reg";
	}

	@RequestMapping(value = "/regItem", method = RequestMethod.POST)
	public String regItem(
			@RequestParam(value = "pro-expo", required=true, defaultValue = "true") String visible,
			@RequestParam(value = "item-best", required=true, defaultValue = "false") String bestItem,
			@RequestParam(value = "item-new", required=true, defaultValue = "false") String newItem,
			@RequestParam(value = "item-code", required=true, defaultValue = "") String code,
			@RequestParam(value = "item-name", required=true, defaultValue = "") String name,
			@RequestParam(value = "item-des", required=false, defaultValue = "false") String des,
			@RequestParam(value = "item-sup-price", required=true, defaultValue = "") int supPrice,
			@RequestParam(value = "item-now-price", required=false,defaultValue = "false") int nowPrice,
			@RequestParam(value = "item-sale", required=false,defaultValue = "false") int sale,
			@RequestParam(value = "item-sale-price", required=false, defaultValue = "false") int salePrice,
			@RequestParam(value = "item-stock", required=true, defaultValue = "") String stock,
			@RequestParam(value = "ship-company-name", required=true, defaultValue = "") String shipCompany,
			@RequestParam(value = "shipping-charge", required=true, defaultValue = "") String shipCharge,
			@RequestParam(value = "image-main", required=true, defaultValue = "") String mainImage,
			@RequestParam(value = "image-sub", required=false, defaultValue = "true") String subImage,
			@RequestParam(value = "item-editor", required=false, defaultValue = "true") String editor,
			ItemVo iVo
			) {				
		if(visible=="visible") iVo.setVisible(true);		
		if(bestItem=="best") iVo.setBestItem(true);		
		if(newItem=="new") iVo.setNewItem(true);		
		iVo.setCode(code);
		iVo.setName(name);
		iVo.setDes(des);
		iVo.setSupPrice(supPrice);
		iVo.setNowPrice(nowPrice);
		iVo.setSale(sale);
		iVo.setMainImage(mainImage);
		iVo.setSubImage(subImage);
		iVo.setEditor(editor);
		
		productService.regItem(iVo);
		
		return "product/reg";
	}	

	@RequestMapping(value = "/modify-item/{vo.no}")
	public String modifyItem(
			@PathVariable("vo.no") int no,
			Model model
			) {		
		ItemVo vo = new ItemVo();
		vo = productService.findItem(no);		
				
		model.addAttribute("vo",vo);
		return "product/reg";
	}
	
	@RequestMapping(value = "/category-reg", method = RequestMethod.GET)
	public String categoryReg(Model model) {
		List<CategoryVo> categoryNameList = productService.getCategoryNameList();
		List<CategoryVo> category2NameList = productService.getCategory2NameList();
		model.addAttribute("categoryNameList", categoryNameList);
		model.addAttribute("category2NameList", category2NameList);
		return "product/category-reg";
	}
	
	@RequestMapping(value = "/category-reg/add", method = RequestMethod.POST)
	public String addCategory(
			@RequestParam(value= "category-name", defaultValue="true") String categoryName
			) {
		
		return "product/category-reg";
	}
	
}
