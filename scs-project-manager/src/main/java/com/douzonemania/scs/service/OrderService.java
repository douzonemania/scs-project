package com.douzonemania.scs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.scs.repository.OrderRepository;
import com.douzonemania.scs.vo.member.OrderSettleVo;

@Service
public class OrderService {

	// 페이징 크기 결정
	private static final int LIST_SIZE =3;
	private static final int PAGE_SIZE =3;
	
	@Autowired
	private OrderRepository orderRepository;
	
	/* 정해진 날짜기간동안 list 출력 */
	public Map<String,Object> findByDate(String startDate, String endDate, String id, int currentPage) {
		
		Map<String, Object> map = new HashMap<>();

		// start index 결정
		int offset=(currentPage-1)*3;

		int total = orderRepository.listCount(startDate, endDate, id);
		System.out.println("total:" + total);
		List<OrderSettleVo> list;
		list = orderRepository.findByDate(startDate, endDate,id, offset, LIST_SIZE);
		
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
		map.put("calCnt", calCnt);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		if(endPage!=pageCnt)
			map.put("listsize",LIST_SIZE);
		else
			map.put("listsize",endPage%5);

		return map;

	}


}
