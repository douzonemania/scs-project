package com.douzonemania.scs.controller;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzonemania.scs.service.ProductService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.ceo.ShipCompanyVo;
import com.douzonemania.scs.vo.member.CategoryVo;
import com.douzonemania.scs.vo.member.ItemBoardVo;
import com.douzonemania.scs.vo.member.ItemReplyVo;
import com.douzonemania.scs.vo.member.ItemVo;
import com.douzonemania.scs.vo.member.OptionVo;
import com.douzonemania.scs.vo.member.StockVo;
import com.douzonemania.security.AuthUser;

@Controller
@RequestMapping("/{id:(?!assets).*}/product")

public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	// product-info 상품 리스트 뿌리기
		@RequestMapping(value = "/info", method = {RequestMethod.GET, RequestMethod.POST})
		public String info(
				Model model,
				@AuthUser CeoVo authUser,
				@RequestParam(value="p", required=true, defaultValue="1") int page,
				@RequestParam(value="kwd", required=true, defaultValue="") String keyword,
				@RequestParam(value="op", required=true, defaultValue="") String option) {
			String id = authUser.getId();
			Map<String, Object> map = productService.getItemList(id, page, keyword, option);
			List<ItemVo> itemList = (List<ItemVo>) map.get("list");
			List<String> salePriceList = new ArrayList<>();
			
			
			for (ItemVo vo : itemList) {
				String price = NumberFormat.getInstance().format( ((int)((double)vo.getNowPrice() * (1 - ((double)vo.getSale() / 100)))+5)/10*10   )+"원";
				salePriceList.add(price);
			}
			
			model.addAttribute("salePriceList", salePriceList);
			model.addAttribute("itemList", itemList);		
			model.addAttribute("map", map);
			
			return "product/info";
		}
		
	// 상품 등록 페이지
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


	// 아이템 수정
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
		List<StockVo> stockList = productService.getStockListByItemNo(id, no);
		System.err.println(vo.getEditor()+"zz");

		String viewer = "quill.setContents([ " + 
				vo.getEditor() +
             "]);";
		
		model.addAttribute("no", no);
		model.addAttribute("vo",vo);	//	아이템정보
		model.addAttribute("cVo",cVo);	//	카테고리정보
		model.addAttribute("categoryNameList",categoryNameList);	//카테고리리스트
		model.addAttribute("category2NameList", category2NameList);	//2차카테고리리스트
		model.addAttribute("sizeOptionList", sizeOptionList);		//사이즈옵션리스트
		model.addAttribute("colorOptionList", colorOptionList);		//컬러옵션리스트
		model.addAttribute("shipCompanyList", shipCompanyList);		//배송사 리스트
		model.addAttribute("stockList", stockList);					//재고리스트
		model.addAttribute("viewer", viewer);						//에디터
		return "product/item-mod";
	}
	
	// 아이템 삭제
	@RequestMapping(value = "/delete-item/{vo.no}", method = RequestMethod.GET)
	public String deleteItem(
			Model model,
			@PathVariable("vo.no") int no,
			@AuthUser CeoVo authUser) {
		String id = authUser.getId();
		productService.delItem(id, no);
	
		return "redirect:/{id}/product/info";
	}
	
	// 카데고리 등록 페이지
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
	
	// 카테고리 추가
	@RequestMapping(value = "/category-reg/add", method = RequestMethod.POST)
	public String addCategory(
			@AuthUser CeoVo authUser,
			@RequestParam(value= "category-name", defaultValue="true") String categoryName
			) {
		String id = authUser.getId();
		return "product/category-reg";
	}
	
	// 옵션 추가
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
	
	// 재고량 확인
	@RequestMapping(value = "/stock/{itemNo}", method = RequestMethod.GET)
	public String stockList(
			@AuthUser CeoVo authUser,
			@PathVariable("itemNo") int no,
			Model model) {				
		String id = authUser.getId();
		System.err.println(no);

		ItemVo iVo = productService.findItem(id, no);
		List<StockVo> stockList = productService.getStockListByItemNo(id, no);
		System.err.println(stockList);
		
		model.addAttribute("iVo", iVo);
		model.addAttribute("stockList", stockList);
		return "product/stock";
	}
	
	@RequestMapping(value= "/board", method = { RequestMethod.GET, RequestMethod.POST })
	public String itemBoardList(@AuthUser CeoVo authUser, Model model,
			@RequestParam(value="p", required=true, defaultValue="1") int page,
			@RequestParam(value="kwd", required=true, defaultValue="") String keyword,
			@RequestParam(value="op", required=true, defaultValue="") String option) {
		
		Map<String, Object> map = productService.itemBoardList(authUser.getId(), page, keyword, option);
		
		model.addAttribute("map", map);
		
		return "product/board";
	}
	
	@RequestMapping(value="/board/reply/{no}")
	public String reply(@AuthUser CeoVo authUser,
			@PathVariable("no") int no, Model model) {

		model.addAttribute("no", no);
		
		return "product/board-write";
	}
	
	@RequestMapping(value="board/view/{no}")
	public String boardView(@AuthUser CeoVo authUser,@PathVariable("no") int no, Model model) {
		
		ItemBoardVo itemBoardVo = productService.findItemBoardByNo(authUser.getId(), no);
		String name = productService.findNameByNo(authUser.getId(), no);
		itemBoardVo.setName(name);
		
		String viewer = "quill2.setContents([ " + 
				itemBoardVo.getContents() +
       "]);";
		
		model.addAttribute("itemBoardVo", itemBoardVo);
		model.addAttribute("viewer", viewer);		// 회원이 작성한 글
		
		// 답글이 있는 경우 
		if(itemBoardVo.isReplyState()) {
			ItemReplyVo itemReplyVo = productService.findItemReplyByParentsNo(authUser.getId(), no);
			String reply = "quill3.setContents([ " + 
								itemReplyVo.getContents() +
			                 "]);";
			
			model.addAttribute("reply", reply);	
			model.addAttribute("itemReplyVo", itemReplyVo);	 // 관리자가 작성한 답글
		
			System.out.println("itemReplyVo");
			System.out.println(itemReplyVo);
		}
		
		return "product/board-view";
	}
}
