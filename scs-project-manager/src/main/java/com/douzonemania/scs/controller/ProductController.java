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
import com.douzonemania.scs.vo.member.ItemVo;

@Controller
@RequestMapping("/product")
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
	public String reg() {			
		
		return "product/reg";
	}

	@RequestMapping(value = "/regItem", method = RequestMethod.POST)
	public String regItem(
			@RequestParam(value = "pro-expo", defaultValue = "true") String visible,
			@RequestParam(value = "item-best", defaultValue = "true") String bestItem,
			@RequestParam(value = "item-new", defaultValue = "true") String newItem,
			@RequestParam(value = "item-code", defaultValue = "true") String code,
			@RequestParam(value = "item-name", defaultValue = "true") String name,
			@RequestParam(value = "item-des", defaultValue = "true") String des,
			@RequestParam(value = "item-sup-price", defaultValue = "true") int supPrice,
			@RequestParam(value = "item-now-price", defaultValue = "true") int nowPrice,
			@RequestParam(value = "item-sale", defaultValue = "true") int sale,
			@RequestParam(value = "item-sale-price", defaultValue = "true") int salePrice,
			@RequestParam(value = "item-stock", defaultValue = "true") String stock,
			@RequestParam(value = "ship-company-name", defaultValue = "true") String shipCompany,
			@RequestParam(value = "shipping-charge", defaultValue = "true") String shipCharge,
			@RequestParam(value = "image-main", defaultValue = "true") String mainImage,
			@RequestParam(value = "image-sub", defaultValue = "true") String subImage,
			@RequestParam(value = "item-editor", defaultValue = "true") String editor,
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
	public String categoryReg() {		
		return "product/category-reg";
	}
	
	@RequestMapping(value = "/category-reg/add", method = RequestMethod.POST)
	public String addCategory(
			@RequestParam(value= "category-name", defaultValue="true") String categoryName
			) {
		System.err.println(categoryName + "!!!!");
		return "product/category-reg";
	}
}
