package com.douzonemania.scs.controller.api;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.douzonemania.scs.dto.JsonResult;
import com.douzonemania.scs.service.ProductService;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.member.CategoryVo;
import com.douzonemania.scs.vo.member.ItemVo;
import com.douzonemania.scs.vo.member.OptionVo;
import com.douzonemania.scs.vo.member.StockVo;
import com.douzonemania.security.AuthUser;

import javafx.application.Application;

@RestController("ProductApiController")
@RequestMapping("/{id:(?!assets).*}/api/product")
public class ProductController {

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
	
	// 컬러 옵션  리스트
	@RequestMapping(value="/option/colorList", method = RequestMethod.POST)
	public JsonResult colorList(
			@AuthUser CeoVo authUser,
			@RequestBody OptionVo oVo			
			) {
		String id = authUser.getId();
		List<OptionVo> colorOptionList = productService.getOptionListOfColor(id);
		return JsonResult.success(colorOptionList);
	}
		
	// 사이즈 옵션  리스트
	@RequestMapping(value="/option/sizeList", method = RequestMethod.POST)
	public JsonResult sizeList(
			@AuthUser CeoVo authUser,
			@RequestBody OptionVo oVo			
			) {
		String id = authUser.getId();
		List<OptionVo> sizeOptionList = productService.getOptionListOfSize(id);
		return JsonResult.success(sizeOptionList);
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
		oVo = productService.getOptionByNo(id, oVo.getNo());
		productService.delOption(id, oVo.getNo());
		return JsonResult.success(oVo);
	}
	
	// 재고량 옵션
	@RequestMapping(value="/stock/add", method = RequestMethod.POST)
	public JsonResult addStock(
			@AuthUser CeoVo authUser,
			@RequestBody OptionVo oVo			
			) {
		String id = authUser.getId();
		List<OptionVo> optionList = productService.getOptionList(id);
		System.err.println(optionList);
		return JsonResult.success(optionList);
	}
	
	// 아이템 등록
	@RequestMapping(value = "/regItem", method = RequestMethod.POST)
	public JsonResult regItem(
			@AuthUser CeoVo authUser,
			@RequestBody ItemVo iVo			
			) {
		String id = authUser.getId();
		JSONObject jObject = new JSONObject(iVo.getEditor());
		JSONArray jArray = jObject.getJSONArray("ops");
		
		System.err.println(iVo.getMainImage()+"!!!!");
		String contents = "";

		for(int i = 0; i < jArray.length(); i++) {
			JSONObject obj = jArray.getJSONObject(i);
			System.out.println("obj:"+obj);
			if(i == jArray.length() - 1) {
				contents += obj;
			}
			else {
				contents += obj + ",";
			}
		}
		
		iVo.setEditor(contents);
		productService.regItem(id, iVo);
		
		return JsonResult.success("");
	}

	// 재고량 등록
	@ResponseBody
	@RequestMapping(value = "/stockInsert/{code}", method = RequestMethod.POST)
	public JsonResult stockInsert(
			@AuthUser CeoVo authUser,		
			@RequestParam(value="colorArr[]") List<Integer> colorArr,
			@RequestParam(value="sizeArr[]") List<Integer> sizeArr,
			@RequestParam(value="stockArr[]") List<Integer> stockArr,
			@PathVariable String code) {				
		String id = authUser.getId();

		int itemNo = productService.getItemNo(id, code);

		for(int i=0;i<sizeArr.size();i++) {
			
			StockVo temp = new StockVo();
			temp.setFirstOption(colorArr.get(i));
			temp.setSecondOption(sizeArr.get(i));
			temp.setStock(stockArr.get(i));
			
			productService.insertStock(id, itemNo, temp);
		}

		return JsonResult.success("");
	}
	
	@ResponseBody
	@RequestMapping(value="/board/write/{no}", method=RequestMethod.POST)
	public JsonResult boardWrite(@AuthUser CeoVo authUser,
			@PathVariable("no") int no, @RequestBody String html) {
		
		boolean replyResult = productService.boardReply(authUser.getId(), no, html);
		productService.setBoardReplyTrue(authUser.getId(), no);
		
		return JsonResult.success(replyResult);
	}
	
	@ResponseBody
	@RequestMapping(value="/board/delete/{no}")
	public JsonResult deleteBoard(@AuthUser CeoVo authUser, @PathVariable int no) {
		
		boolean deleteResult = productService.deleteItemBoard(authUser.getId(), no);
		
		return JsonResult.success(deleteResult);
	}

	// 수정 옵션 뿌리기
	@RequestMapping(value="/optionList/{no}", method = RequestMethod.POST)
	public JsonResult optionList(
			@AuthUser CeoVo authUser,
			@RequestBody OptionVo oVo,	
			@PathVariable("no") int no
			) {
		String id = authUser.getId();
		
		List<StockVo> stockList = productService.getStockListByItemNo(id, no);
		return JsonResult.success(stockList);
	}
	
	// 아이템수정
	@RequestMapping(value="/modItem", method = RequestMethod.POST)
	public JsonResult modItem(
			@AuthUser CeoVo authUser,
			@RequestBody ItemVo iVo			
			) {
		System.err.println(iVo+"!!");

		System.out.println("editor: " + iVo.getEditor());
		
		JSONObject jObject = new JSONObject(iVo.getEditor());
		
		JSONArray jArray = jObject.getJSONArray("ops");

		String contents = "";

		for(int i = 0; i < jArray.length(); i++) {
			JSONObject obj = jArray.getJSONObject(i);
			System.out.println("obj:"+obj);
			if(i == jArray.length() - 1) {
				contents += obj;
			}
			else {
				contents += obj + ",";
			}
		}
			String id = authUser.getId();
			iVo.setEditor(contents);
			
			System.out.println("passing editor: " + iVo.getEditor());
			
			String viewer = "quill.setContents([ " + 
					iVo.getEditor() +
	       "]);";			
			
			productService.updateItem(id, iVo);
			return JsonResult.success(viewer);
	}
	
	// 재고량 수정
		@ResponseBody
		@RequestMapping(value = "/stockMod/{code}", method = RequestMethod.POST)
		public JsonResult stockMod(
				@AuthUser CeoVo authUser,		
				@RequestParam(value="colorArr[]") List<Integer> colorArr,
				@RequestParam(value="sizeArr[]") List<Integer> sizeArr,
				@RequestParam(value="stockArr[]") List<Integer> stockArr,
				@PathVariable String code
				) {				
			String id = authUser.getId();
			
			int itemNo = productService.getItemNo(id, code);
			
			// 아이템 no 해당 아이템 전부 삭제
			productService.delStock(id, itemNo);
			for(int i=0;i<sizeArr.size();i++) {
				
				StockVo temp = new StockVo();
				temp.setFirstOption(colorArr.get(i));
				temp.setSecondOption(sizeArr.get(i));
				temp.setStock(stockArr.get(i));
				// stock insert
				productService.insertStock(id, itemNo, temp);
			}

			return JsonResult.success("");
		}
		
		// 이미지 파싱		
		@RequestMapping(value="/image", method = RequestMethod.POST, consumes ={"multipart/form-data"})
		public JsonResult image(
				@AuthUser CeoVo authUser,
				@RequestParam(value = "excelFile") MultipartFile excelFile,
				@RequestParam(value = "excelFile1") MultipartFile excelFile1,
				@RequestParam(value = "excelFile2") MultipartFile excelFile2,
				@RequestParam(value = "excelFile3") MultipartFile excelFile3,
				@RequestParam(value = "excelFile4") MultipartFile excelFile4,
				@RequestParam(value = "excelFile5") MultipartFile excelFile5
				) throws Exception{			
		
			String id = authUser.getId();			
			String mainImage = productService.restore(id, excelFile);
			String subImage1 = productService.restore(id, excelFile1);
			String subImage2 = productService.restore(id, excelFile2);
			String subImage3 = productService.restore(id, excelFile3);
			String subImage4 = productService.restore(id, excelFile4);
			String subImage5 = productService.restore(id, excelFile5);
			String image = mainImage + "?" + subImage1 + "?" + subImage2 + "?" + subImage3 + "?" + subImage4 + "?" + subImage5; 
			
			return JsonResult.success(image);
		}
		
		@RequestMapping(value="/image/mod", method = RequestMethod.POST, consumes ={"multipart/form-data"})
		public JsonResult imageMod(
				@AuthUser CeoVo authUser,
				@RequestParam(value = "excelFile") MultipartFile excelFile,
				@RequestParam(value = "excelFile1") MultipartFile excelFile1,
				@RequestParam(value = "excelFile2") MultipartFile excelFile2,
				@RequestParam(value = "excelFile3") MultipartFile excelFile3,
				@RequestParam(value = "excelFile4") MultipartFile excelFile4,
				@RequestParam(value = "excelFile5") MultipartFile excelFile5,
				@RequestParam(value="subSrcArray") List<String> subSrcArray				
				) throws Exception{			
			
			String id = authUser.getId();
						
			String mainImage = productService.restore(id, excelFile, subSrcArray.get(0));
			String subImage1 = productService.restore(id, excelFile1, subSrcArray.get(1));
			String subImage2 = productService.restore(id, excelFile2, subSrcArray.get(2));
			String subImage3 = productService.restore(id, excelFile3, subSrcArray.get(3));
			String subImage4 = productService.restore(id, excelFile4, subSrcArray.get(4));
			String subImage5 = productService.restore(id, excelFile5, subSrcArray.get(5));
			String image = mainImage + "?" + subImage1 + "?" + subImage2 + "?" + subImage3 + "?" + subImage4 + "?" + subImage5; 
			System.err.println(image +"sst");
			return JsonResult.success(image);
		}		

}