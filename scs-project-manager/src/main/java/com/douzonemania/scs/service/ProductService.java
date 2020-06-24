package com.douzonemania.scs.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.douzonemania.scs.repository.ProductRepository;
import com.douzonemania.scs.vo.ceo.ProductStatisticsVo;
import com.douzonemania.scs.vo.ceo.ShipCompanyVo;
import com.douzonemania.scs.vo.member.BoardVo;
import com.douzonemania.scs.vo.member.CategoryVo;
import com.douzonemania.scs.vo.member.ItemBoardVo;
import com.douzonemania.scs.vo.member.ItemReplyVo;
import com.douzonemania.scs.vo.member.ItemVo;
import com.douzonemania.scs.vo.member.OptionVo;
import com.douzonemania.scs.vo.member.StockVo;

@Service
public class ProductService {

	private static final int LIST_SIZE =5;
	private static final int PAGE_SIZE =5;
	private static final String SAVE_PATH = "/scs-uploads";
	//private static final String SAVE_PATH = "C:\\Users\\bit-user\\git\\scs-project\\scs-project-manager\\src\\main\\webapp\\assets\\images\\scs-uploads";
	private static final String URL = "/assets/scs-manager/images";
	
	@Autowired
	private ProductRepository productRepository;

	/* 상품 리스트 가져오기 */
	public Map<String, Object> getItemList(String id, int currentPage,String key,String option) {
		Map<String, Object> map = new HashMap<>();
		
		// keyword 지정
		String keywordList[] = key.split(",");
		String keyword="";
		if(keywordList.length == 2) {
			if(option.equals("visible")) {
					keyword = keywordList[1];
			}
			else {
				keyword = keywordList[0];
			}
		}
		else {
			keyword = key;
		}

		int offset=(currentPage-1)*5;
		
		int total = productRepository.listCount(id, option, keyword);
		
		List<ItemVo> list;
		if(option.equals("")) {
			list = productRepository.getItemList(id, offset, LIST_SIZE);
		}
		else {
			list = productRepository.getSearchItemList(id, option, keyword, offset, LIST_SIZE);
		}
		
		System.out.println("count:"+total);
		
		for (ItemVo itemVo : list) {
			System.out.println(itemVo);
		}
		
		int pageCnt=(total%LIST_SIZE!=0) ? (total/LIST_SIZE)+1 : (total/LIST_SIZE);
		int calCnt=(currentPage%5)==0 ? currentPage-1 : currentPage;

		int beginPage=calCnt-(calCnt%5)==0 ? 1 : calCnt-(calCnt%5)+1;
		int prevPage = beginPage == 1 ? 1 : beginPage -1;
		int endPage = (pageCnt-(pageCnt%5))==(calCnt-(calCnt%5)) ? pageCnt : (beginPage+PAGE_SIZE)-1;
		int nextPage = (pageCnt-(pageCnt%5))==(calCnt-(calCnt%5)) ? pageCnt : endPage+1;

		if(nextPage>=pageCnt)
			nextPage=pageCnt;
		if(endPage>=pageCnt)
			endPage=pageCnt;

		map.put("list", list);
		map.put("beginPage",beginPage);
		map.put("prevPage",prevPage);
		map.put("endPage",endPage);
		map.put("nextPage",nextPage);
		map.put("page",currentPage);
		map.put("total",total);
		map.put("option", option);
		map.put("kwd",keyword);
		map.put("calCnt", calCnt);

		if(endPage!=pageCnt)
			map.put("listsize",LIST_SIZE);
		else {
			if(endPage%5==0) {
				map.put("listsize",5);
			}else {
				map.put("listsize",endPage%5);
			}
		}

		return map;
	}

	/* 상품 등록*/
	public int regItem(String id, ItemVo iVo) {
		return productRepository.regItem(id, iVo);		
	}
	
	/* 해당 no 상품 검색 */
	public ItemVo findItem(String id, int no) {
		return productRepository.findItem(id, no);
	}

	/* 카테고리 추가하기 */
	public int addCategory(String id, CategoryVo cVo) {		
		return productRepository.addCategory(id, cVo);		
	}

	/* 카테고리 이름으로 검색 */
	public CategoryVo findCategoryByName(String id, String name) {
		return productRepository.findCategoryByName(id, name);
	}

	/* 카테고리 번호로 검색 */
	public CategoryVo findCategoryByNo(String id, int no) {
		return productRepository.findCategoryByNo(id, no);
	}
	
	/* 카테고리 삭제하기 */
	public int delCategory(String id, String name) {
		return productRepository.delCategory(id, name);		
	}

	/* 1차 카테고리 이름 리스트  */
	public List<CategoryVo> getCategoryNameList(String id) {		
		return productRepository.getCategoryNameList(id);
	}
	
	/* 2차 카테고리 부모카테고리번호 별 이름 리스트  */
	public List<CategoryVo> getCategory2NameList(String id, int parentCategoryNo) {		
		return productRepository.getCategory2NameList(id, parentCategoryNo);
	}
	/* 2차 카테고리 전체 이름 리스트 */ 
	public List<CategoryVo> getCategory2NameList(String id) {
		return productRepository.getCategory2NameList(id);
	}
	
	/* 카테고리 수정하기 */
	public int updateCategory(String id, String name, String afterName) {
		return productRepository.updateCategory(id, name, afterName);
		
	}
	/* 카테고리 추가시 카테고리 이름으로 부모 카테고리 번호 검색 */
	public int getCategoryNoByName(String id, String parentCategory) {
		return productRepository.findCategoryNoByName(id, parentCategory);		
	}

	public List<OptionVo> getOptionListOfSize(String id) {
		return productRepository.getOptionListOfSize(id);
	}
	
	public List<OptionVo> getOptionListOfColor(String id) {
		return productRepository.getOptionListOfColor(id);
	}

	public int addSizeOption(String id, String name) {
		return productRepository.addSizeOption(id, name);
	}

	public int addColorOption(String id, String name) {
		return productRepository.addColorOption(id, name);
	}

	public OptionVo getOption(String id, String name) {
		return productRepository.getOption(id, name);
	}
	
	public OptionVo getOptionByNo(String id, int no) {
		return productRepository.getOptionByNo(id, no);
	}

	public int delOption(String id, int no) {
		return productRepository.delOption(id, no);
	}

	public List<OptionVo> getOptionList(String id) {
		return productRepository.getOptionList(id);
	}

	public List<ShipCompanyVo> getShipCompanyList(String id) {
		return productRepository.getShipCompanyList(id);
	}

	public int getItemNo(String id, String code) {
		return productRepository.getItemNo(id, code);
	}

	public int insertStock(String id, int itemNo, StockVo sVo) {
		return productRepository.insertStock(id, itemNo, sVo);
	}

	public int delItem(String id, int no) {
		return productRepository.delItem(id, no);		
	}

	public List<StockVo> getStockListByItemNo(String id, int no) {
		return productRepository.getStockListByItemNo(id, no);
	}

	// 페이징, 리스트
	public Map<String,Object> itemBoardList(String id, int currentPage,String keyword,String option) {

		Map<String, Object> map = new HashMap<>();

		// start index 결정
		int offset=(currentPage-1)*5;

		int total = productRepository.itemBoardListCount(id, option, keyword);


		List<BoardVo> list;
		if(option.equals("")) {
			list = productRepository.itemBoardList(id, offset, LIST_SIZE, 1);
		}
		else {
			list = productRepository.searchItemBoardList(id, option, keyword, offset, LIST_SIZE);
		}

		int pageCnt=(total%LIST_SIZE!=0) ? (total/LIST_SIZE)+1 : (total/LIST_SIZE);
		int calCnt=(currentPage%5)==0 ? currentPage-1 : currentPage;

		int beginPage=calCnt-(calCnt%5)==0 ? 1 : calCnt-(calCnt%5)+1;
		int prevPage = beginPage == 1 ? 1 : beginPage -1;
		int endPage = (pageCnt-(pageCnt%5))==(calCnt-(calCnt%5)) ? pageCnt : (beginPage+PAGE_SIZE)-1;
		int nextPage = (pageCnt-(pageCnt%5))==(calCnt-(calCnt%5)) ? pageCnt : endPage+1;

		if(nextPage>=pageCnt)
			nextPage=pageCnt;
		if(endPage>=pageCnt)
			endPage=pageCnt;

		map.put("list", list);
		map.put("beginPage",beginPage);
		map.put("prevPage",prevPage);
		map.put("endPage",endPage);
		map.put("nextPage",nextPage);
		map.put("page",currentPage);
		map.put("total",total);
		map.put("option", option);
		map.put("kwd",keyword);
		map.put("calCnt", calCnt);

		if(endPage!=pageCnt)
			map.put("listsize",LIST_SIZE);
		else {
			if(endPage%5==0) {
				map.put("listsize",5);
			}else {
				map.put("listsize",endPage%5);
			}
		}
		return map;

	}

	public boolean boardReply(String id, int no, String jsonData) {
		JSONObject jObject = new JSONObject(jsonData);

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

		int count = productRepository.boardReply(id, no, contents);
		return count == 1;
	}

	public boolean updateItemBoardReplyTrue(String id, int no) {
		// 답글 상태를 true로 만들기
		int count = productRepository.updateBoardReply(id, no, true);
		return count == 1;
	}
	
	public boolean updateItemBoardReplyFalse(String id, int no) {
		// 답글 상태를 false로 만들기
		int count = productRepository.updateBoardReply(id, no, false);
		return count == 1;
	}


	public ItemBoardVo findItemBoardByNo(String id, int no) {
		return productRepository.findItemBoardByNo(id, no);
	}

	public String findNameByNo(String id, int no) {
		return productRepository.findNameByNo(id, no);
	}

	public ItemReplyVo findItemReplyByParentsNo(String id, int no) {
		return productRepository.findItemReplyByParentsNo(id, no);
	}

	public boolean deleteItemBoard(String id, int no) {
		int count = productRepository.deleteItemBoard(id, no);
		return count == 1;
	}

	public int updateItem(String id, ItemVo iVo) {
		return  productRepository.updateItem(id,iVo);
	}

	public int delStock(String id, int itemNo) {
		return productRepository.delStock(id, itemNo);
	}
	//파일 업로드
	public String restore(String id, MultipartFile excelFile) {
		String url = "";
		try {
			if (excelFile.isEmpty()) {
				return url;
			}

			String originFilename = excelFile.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf('.') + 1);

			String saveFilename = generateSaveFilename(originFilename, extName);
			long fileSize = excelFile.getSize();

			byte[] fileData = excelFile.getBytes();
			OutputStream os = new FileOutputStream(SAVE_PATH + "/" + saveFilename);
			System.out.println("TEST! :"+os.toString());
			os.write(fileData);
			os.close();
			url = URL + "/" + saveFilename;
			
		} catch (IOException ex) {
			throw new RuntimeException("file upload error:" + ex);
		}
		System.out.println("url:" + url);
		return url;
	}
	
	//파일 수정
	public String restore(String id, MultipartFile excelFile, String src) {
		String url = "";
		try {
			if(src != null && excelFile.isEmpty()) {
				url = src;
				System.err.println("::::::::URL:::::::::" + url);
				return url;
			}else if(excelFile.isEmpty()){
				return url;
			}else {
			String originFilename = excelFile.getOriginalFilename();
			System.err.println("!!!!OriginFIleName!!!" + originFilename);	
			String extName = originFilename.substring(originFilename.lastIndexOf('.') + 1);

			String saveFilename = generateSaveFilename(originFilename, extName);

			byte[] fileData = excelFile.getBytes();
			OutputStream os = new FileOutputStream(SAVE_PATH + "/" + saveFilename);
			System.out.println("TEST1:" + os.toString());
			os.write(fileData);
			os.close();
			url = URL + "/" + saveFilename;
			}
		} catch (IOException ex) {
			throw new RuntimeException("file upload error:" + ex);
		}
		System.out.println("url:" + url);
		return url;
	}
	// 파일 네임 변환
	private String generateSaveFilename(String originFileName, String extName) {
		String filename = "";

		Calendar calendar = Calendar.getInstance();
		filename += calendar.get(Calendar.YEAR);
		filename += calendar.get(Calendar.MONTH);
		filename += calendar.get(Calendar.DATE);
		filename += calendar.get(Calendar.HOUR);
		filename += calendar.get(Calendar.MINUTE);
		filename += calendar.get(Calendar.SECOND);
		filename += calendar.get(Calendar.MILLISECOND);
		//filename += ("." + originFileName);
		filename += ("." + extName);

		return filename;
	}

	public boolean deleteItemBoardReply(String id, int no) {
		int count = productRepository.deleteItemBoardReply(id, no);
		return count == 1;
	}

	public List<ProductStatisticsVo> getStatisticsByItemNo(String id, int no) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH ) + 1;
		int date = cal.get(Calendar.DATE);
		
		List<ProductStatisticsVo> list = new ArrayList<ProductStatisticsVo>();
		for(int i=0; i<7; i++) {
			ProductStatisticsVo vo = new ProductStatisticsVo();
			vo.setDate(get7DayAgoDate(year, month, date, i));
			list.add(vo);
		}
		List<ProductStatisticsVo> returnList = productRepository.getStatisticsByItemNo(id,no, list.get(6).getDate(), list.get(0).getDate());
		for (ProductStatisticsVo vo : returnList) {
			String returnDate = vo.getDate();
			for(int i = 0; i < 7; i++) {
				if(returnDate.contentEquals(list.get(i).getDate())) {
					list.get(i).setCount(vo.getCount());
				}
			}
		}
		
		for (ProductStatisticsVo vo : list) {
			System.out.println(vo);
		}
		return list;
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

	public int getShippingCharge(String id) {
		return productRepository.getShippingCharge(id);
	}
	
	
	
}
