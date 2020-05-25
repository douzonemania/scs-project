package com.douzonemania.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.shop.repository.OrderRepository;
import com.douzonemania.shop.vo.CategoryVo;
import com.douzonemania.shop.vo.ItemVo;


@Service
public class OrderService {

	private static final int LIST_SIZE =5;
	private static final int PAGE_SIZE =5;
	
	
	@Autowired
	private OrderRepository orderRepository;
	
	public Map<String,Object> find(int currentPage,String keyword,String option,int category,int subCategory){
		
		int offset=(currentPage-1)*5;
		int total = orderRepository.totalCount(option,keyword,category,subCategory);
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
		
		System.out.println("TOTAL COUNT:"+total);
		
		List<ItemVo> tempList = orderRepository.find(offset,keyword,category);
		List<ItemVo> list=orderRepository.calReviewAvg(tempList);
		
		Map<String,Object> map = new HashMap<>();
		

		if(category!=1) {
			List<CategoryVo> categoryList=orderRepository.findCategoryList(category);
			map.put("category", categoryList);	
			
			for (CategoryVo categoryVo : categoryList) {
				System.out.println(categoryVo);
			}
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
	
}
