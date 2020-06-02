package com.douzonemania.scs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.scs.repository.OrderRepository;
import com.douzonemania.scs.vo.member.OrderDeliveryVo;
import com.douzonemania.scs.vo.member.OrderSettleVo;

@Service
public class OrderService {

	// 페이징 크기 결정
	private static final int LIST_SIZE =5;
	private static final int PAGE_SIZE =5;
	
	@Autowired
	private OrderRepository orderRepository;

	/* Delivery 정해진 날짜기간동안 list 출력 */
	public Map<String, Object> findDeliveryByDate(String startDate, String endDate, String id, int currentPage, String option, String keyword) {
		Map<String, Object> map = new HashMap<>();

		// start index 결정
		int offset=(currentPage-1)*5;

		int total = orderRepository.countDeliveryList(startDate, endDate, id, option, keyword);
		
		
		System.out.println("total:" + total);
		List<OrderDeliveryVo> list;
		list = orderRepository.findDeliveryByDate(startDate, endDate,id, option, keyword, offset, LIST_SIZE);
		System.out.println(list);
		
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

		 int dataValue = 0;
		
		for (OrderDeliveryVo orderDeliveryVo : list) {
			
			String status = orderDeliveryVo.getStatus();
			
			  if(("주문완료").equals(status)) {
				  dataValue = 1;
			  } else if(("입금완료").equals(status)) {
				  dataValue = 2;
			  } else if(("배송준비중").equals(status)) {
				  dataValue = 3;
			  } else if(("배송중").equals(status)) {
				  dataValue = 4;
			  } else if(("배송완료").equals(status)) {
				  dataValue = 5;
			  } else if(("취소처리중").equals(status)) {
				  dataValue = 6;
			  } else if(("교환처리중").equals(status)) {
				  dataValue = 7;
			  } else if(("환불처리중").equals(status)) {
				  dataValue = 8;
			  } else if(("처리완료").equals(status)) {
				  dataValue = 9;
			  }
			  orderDeliveryVo.setDataValue(dataValue);
		}
		
		
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
		map.put("option", option);
		map.put("kwd", keyword);
		
		if(endPage!=pageCnt)
			map.put("listsize",LIST_SIZE);
		else
			map.put("listsize",endPage%5);

		return map;
	}
	
	public int updateStatus(String id, int no, String status) {
		
		return orderRepository.updateStatus(id, no, status);
	}
	
	/* Settle 정해진 날짜기간동안 list 출력 */
	public Map<String,Object> findSettleByDate(String startDate, String endDate, String id, int currentPage) {
		
		Map<String, Object> map = new HashMap<>();

		// start index 결정
		int offset=(currentPage-1)*3;

		int total = orderRepository.countSettleList(startDate, endDate, id);
		System.out.println("total:" + total);
		List<OrderSettleVo> list;
		list = orderRepository.findSettleByDate(startDate, endDate,id, offset, LIST_SIZE);
		int totalPrice = 0;
		int totalMargin = 0;
		if(list.size() > 0) {
			totalPrice = orderRepository.findTotalPrice(startDate, endDate, id);
			totalMargin = orderRepository.findTotalMargin(startDate, endDate, id);
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
		map.put("calCnt", calCnt);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("totalPrice", totalPrice);
		map.put("totalMargin", totalMargin);
		
		if(endPage!=pageCnt)
			map.put("listsize",LIST_SIZE);
		else
			map.put("listsize",endPage%5);

		return map;

	}

	public OrderDeliveryVo findDeliveryByNo(String id, int no) {
		return orderRepository.findDeliveryByNo(id, no);
	}

	public String findStatement(String id, int no) {
		return orderRepository.findStatement(id,no);
	}






}
