package com.douzonemania.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.shop.repository.OrderRepository;
import com.douzonemania.shop.vo.CartVo;
import com.douzonemania.shop.vo.CategoryVo;
import com.douzonemania.shop.vo.ItemVo;
import com.douzonemania.shop.vo.OptionVo;
import com.douzonemania.shop.vo.StockVo;


@Service
public class OrderService {

	private static final int LIST_SIZE =5;
	private static final int PAGE_SIZE =5;
	
	
	@Autowired
	private OrderRepository orderRepository;
	
	public Map<String,Object> find(int currentPage,String keyword,String option,int category,int subCategory,String db){
		
		int offset=(currentPage-1)*5;
		int total = orderRepository.totalCount(option,keyword,category,subCategory,db);
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
		
	
		List<ItemVo> tempList = orderRepository.find(offset,keyword,category,db);
		List<ItemVo> list=orderRepository.calReviewAvg(tempList,db);
		
		Map<String,Object> map = new HashMap<>();
		

		if(category!=1) {
			List<CategoryVo> categoryList=orderRepository.findCategoryList(category,db);
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

	public Map<String, Object> findProduct(Integer no,String db) {
		
		ItemVo vo = orderRepository.findProduct(no,db);
		
		if(vo.getSale()!=0) {
			vo.setTotalPrice((int) ((int)vo.getNowPrice()-(vo.getNowPrice()*(0.01*vo.getSale()))));
		}
		Map<String,Object> map=new HashMap<String, Object>();
		
		map.put("product", vo);
		
		
		return map;
	}

	public List<OptionVo> findOptionList(Integer no,String db) {
		
		List<OptionVo> list = orderRepository.findOptionList(no,db);
		
		return list;
	}

	public List<OptionVo> findSecondOption(int no, int option,String db) {
	
		List<OptionVo> list = orderRepository.findSecondOption(no,option,db);
		
		return list;
		
	}

	public void setCart(int no, int firstOption, int secondOption, int quantity,String db,long memberNo) {
	
		CartVo checkCart = orderRepository.checkAmount(no,firstOption,secondOption,db,memberNo);
		
		int stockNo = orderRepository.getStockNo(no,firstOption,secondOption,db);
		if(checkCart.getAmount()==0) {
			orderRepository.insertCart(memberNo,quantity,stockNo,db);
		}else {
			int calAmount =checkCart.getAmount()+quantity;
			orderRepository.updateCart(db,checkCart.getNo(),calAmount);
		}
		
	}

	public List<ItemVo> setCartList(String db,long memberNo) {
		
		
		List<ItemVo> list = orderRepository.setCartList(db,memberNo);
		
		for (ItemVo itemVo : list) {
			int nowSale = itemVo.getSale();
			
			if(nowSale !=0) {
				int nowPrice= itemVo.getNowPrice();
				double calSale = (nowSale * 0.01);
				int totalPrice = nowPrice - (int)(nowPrice*calSale);
				itemVo.setTotalPrice(totalPrice);
			}else {
				itemVo.setTotalPrice(itemVo.getNowPrice());
			}
		}
		
		return list;
	}

	public void deleteCart(String db, Long long1, int cartNo) {
		
		orderRepository.deleteCart(db,long1,cartNo);
		
	}


	public void deleteCartAll(String db, Long no) {
		
		orderRepository.deleteCartAll(db,no);
		
	}
	public ItemVo setOrderItem(String db, Long no, Integer cartNo) {
		
		
		ItemVo temp = orderRepository.setOrderItem(db,no,cartNo);
		
		
		return temp;
	}


	
	
}
















