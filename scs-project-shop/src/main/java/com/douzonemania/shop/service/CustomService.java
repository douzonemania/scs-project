package com.douzonemania.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.shop.repository.CustomRepository;
import com.douzonemania.shop.vo.CategoryVo;
import com.douzonemania.shop.vo.ContentsVo;
import com.douzonemania.shop.vo.CustomDesignVo;
import com.douzonemania.shop.vo.ItemVo;
import com.douzonemania.shop.vo.SubMenuVo;

@Service
public class CustomService {

	private static final int LIST_SIZE =16;
	private static final int PAGE_SIZE =5;
	
	@Autowired
	private CustomRepository customRepository;

	// BEST ITEM LIST
	public Map<String,Object> bestFind(int currentPage,String keyword,String option,int category,int subCategory,String db){
		
		int offset=(currentPage-1)*16;
		int total = customRepository.bestTotalCount(option,keyword,category,subCategory,db);
		int pageCnt=(total%LIST_SIZE!=0) ? (total/LIST_SIZE)+1 :  (total/LIST_SIZE);
		int calCnt=(currentPage%5)==0 ? currentPage-1 : currentPage;
	
		int beginPage=calCnt-(calCnt%5)==0 ? 1 : calCnt-(calCnt%5)+1;
		int prevPage = beginPage == 1 ? 1 : beginPage -1;
		int endPage = (pageCnt-(pageCnt%5))==(calCnt-(calCnt%5)) ? pageCnt : (beginPage+PAGE_SIZE)-1;
		int nextPage = (pageCnt-(pageCnt%5))==(calCnt-(calCnt%5)) ? pageCnt : endPage+1;
		
		if(nextPage>=pageCnt)
			nextPage=pageCnt;
		if(endPage>=pageCnt)
			endPage=pageCnt;
		
	
		List<ItemVo> tempList = customRepository.bestFind(offset,keyword,category,db);
		List<ItemVo> list=customRepository.calReviewAvg(tempList,db);
		
		Map<String,Object> map = new HashMap<>();
		

		if(category!=1) {
			List<CategoryVo> categoryList=customRepository.findCategoryList(category,db);
			map.put("category", categoryList);	
			
		}
		
		
		map.put("list", list);
		map.put("beginPage",beginPage);
		map.put("prevPage",prevPage);
		map.put("endPage",endPage);
		map.put("nextPage",nextPage);
		map.put("page",currentPage);
		map.put("total",total);
		map.put("kwd",keyword);
		if(endPage!=pageCnt)
			map.put("listsize",LIST_SIZE);
		else
			map.put("listsize",endPage%5);
		
		return map;
		
	}
	
	// NEW ITEM LIST	
	public Map<String,Object> newFind(int currentPage,String keyword,String option,int category,int subCategory,String db){
		
		int offset=(currentPage-1)*16;
		int total = customRepository.newTotalCount(option,keyword,category,subCategory,db);
		int pageCnt=(total%LIST_SIZE!=0) ? (total/LIST_SIZE)+1 :  (total/LIST_SIZE);
		int calCnt=(currentPage%5)==0 ? currentPage-1 : currentPage;
	
		int beginPage=calCnt-(calCnt%5)==0 ? 1 : calCnt-(calCnt%5)+1;
		int prevPage = beginPage == 1 ? 1 : beginPage -1;
		int endPage = (pageCnt-(pageCnt%5))==(calCnt-(calCnt%5)) ? pageCnt : (beginPage+PAGE_SIZE)-1;
		int nextPage = (pageCnt-(pageCnt%5))==(calCnt-(calCnt%5)) ? pageCnt : endPage+1;
		
		if(nextPage>=pageCnt)
			nextPage=pageCnt;
		if(endPage>=pageCnt)
			endPage=pageCnt;
		
	
		List<ItemVo> tempList = customRepository.newFind(offset,keyword,category,db);
		List<ItemVo> list=customRepository.calReviewAvg(tempList,db);
		
		Map<String,Object> map = new HashMap<>();
		

		if(category!=1) {
			List<CategoryVo> categoryList=customRepository.findCategoryList(category,db);
			map.put("category", categoryList);	
			
		}
		
		
		map.put("list", list);
		map.put("beginPage",beginPage);
		map.put("prevPage",prevPage);
		map.put("endPage",endPage);
		map.put("nextPage",nextPage);
		map.put("page",currentPage);
		map.put("total",total);
		map.put("kwd",keyword);
		if(endPage!=pageCnt)
			map.put("listsize",LIST_SIZE);
		else
			map.put("listsize",endPage%5);
		
		return map;
		
	}
	
	// NEW ITEM LIST	
	public Map<String,Object> saleFind(int currentPage,String keyword,String option,int category,int subCategory,String db){
		
		int offset=(currentPage-1)*16;
		int total = customRepository.saleTotalCount(option,keyword,category,subCategory,db);
		int pageCnt=(total%LIST_SIZE!=0) ? (total/LIST_SIZE)+1 :  (total/LIST_SIZE);
		int calCnt=(currentPage%5)==0 ? currentPage-1 : currentPage;
	
		int beginPage=calCnt-(calCnt%5)==0 ? 1 : calCnt-(calCnt%5)+1;
		int prevPage = beginPage == 1 ? 1 : beginPage -1;
		int endPage = (pageCnt-(pageCnt%5))==(calCnt-(calCnt%5)) ? pageCnt : (beginPage+PAGE_SIZE)-1;
		int nextPage = (pageCnt-(pageCnt%5))==(calCnt-(calCnt%5)) ? pageCnt : endPage+1;
		
		if(nextPage>=pageCnt)
			nextPage=pageCnt;
		if(endPage>=pageCnt)
			endPage=pageCnt;
		
	
		List<ItemVo> tempList = customRepository.saleFind(offset,keyword,category,db);
		List<ItemVo> list=customRepository.calReviewAvg(tempList,db);
		
		Map<String,Object> map = new HashMap<>();
		

		if(category!=1) {
			List<CategoryVo> categoryList=customRepository.findCategoryList(category,db);
			map.put("category", categoryList);	
			
		}
		
		
		map.put("list", list);
		map.put("beginPage",beginPage);
		map.put("prevPage",prevPage);
		map.put("endPage",endPage);
		map.put("nextPage",nextPage);
		map.put("page",currentPage);
		map.put("total",total);
		map.put("kwd",keyword);
		if(endPage!=pageCnt)
			map.put("listsize",LIST_SIZE);
		else
			map.put("listsize",endPage%5);
		
		return map;
		
	}
	
	public List<CustomDesignVo> getCustomDesignBySubMenu(int subMenuNo) {
		return customRepository.getCustomDesignBySubMenu(subMenuNo);
	}

	public List<ContentsVo> getContentsByCustomNo(int customNo) {
		return customRepository.getContentsByCustomNo(customNo);
	}

	public List<SubMenuVo> getSubMenuById(String id) {
		return customRepository.getSubMenuById(id);
	}

	public int findSubMenuNo(String db ,int no) {

		return customRepository.findSubMenuNo(db,no);
	}
}
