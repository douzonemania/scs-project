package com.douzonemania.shop.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.shop.repository.OrderRepository;
import com.douzonemania.shop.vo.CartVo;
import com.douzonemania.shop.vo.CategoryVo;
import com.douzonemania.shop.vo.ItemVo;
import com.douzonemania.shop.vo.OptionVo;
import com.douzonemania.shop.vo.ShipVo;
import com.douzonemania.shop.vo.StockVo;


@Service
public class OrderService {

	private static final int LIST_SIZE =16;
	private static final int PAGE_SIZE =5;
	
	
	@Autowired
	private OrderRepository orderRepository;
	
	public Map<String,Object> find(int currentPage,String keyword,String option,int category,int subCategory,String db){
		
		int offset=(currentPage-1)*16;
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
		System.out.println(vo.getSubImage());
		String[] subImages = vo.getSubImage().split("\\?");
		List<String> list = new ArrayList<String>();
		
		for(int i=0; i<subImages.length; i++) {
			System.out.println(subImages[i]);
			list.add(subImages[i]);
		}
		
		if(vo.getSale()!=0) {
			vo.setTotalPrice((int) ((int)vo.getNowPrice()-(vo.getNowPrice()*(0.01*vo.getSale()))));
		}
		Map<String,Object> map=new HashMap<String, Object>();
		
		map.put("product", vo);
		
		map.put("subImages", list);
		System.out.println(map);
		
		
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
		System.out.println("TEST : "+checkCart);
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
			
			itemVo = setTotalPrice(nowSale, itemVo);
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

	public void setOrderPage(String db, Long no, List<Integer> cartNoList, List<Integer> amountList, HttpSession session) {
		List<ItemVo> list = new ArrayList();
		List<ShipVo> shipList = orderRepository.findShipAddressList(db,no);
		
		
		int index = 0;
		
		if(shipList.size()!=0) {
			session.setAttribute("shipListCheck", true);
			session.setAttribute("shipList", shipList);
			ShipVo vo = new ShipVo();
			for (ShipVo shipVo : shipList) {
				
				if(shipVo.isRecent()==true) {
					vo=shipVo;
				}
			}
			
			session.setAttribute("recentShip", vo);
		}else {
			session.setAttribute("shipListCheck", false);
			
		}
		
		
		for (Integer integer : cartNoList) {
			
			ItemVo temp =orderRepository.setOrderItem(db,no,integer);
			temp.setAmount(amountList.get(index++));
			
			int nowSale = temp.getSale();
			
			temp = setTotalPrice(nowSale, temp);
			list.add(temp);
			
		}
		session.setAttribute("orderList", list);
	}
	
	public void setOrderPage(String db, Long no, int itemNo,int firstOption, int secondOption,int quantity, HttpSession session) {
		List<ShipVo> shipList = orderRepository.findShipAddressList(db,no);
		
		
		List<ItemVo> list = new ArrayList();
		if(shipList.size()!=0) {
			session.setAttribute("shipListCheck", true);
			session.setAttribute("shipList", shipList);
			ShipVo vo = new ShipVo();
			for (ShipVo shipVo : shipList) {
				
				if(shipVo.isRecent()==true) {
					vo=shipVo;
				}
			}
			
			session.setAttribute("recentShip", vo);
		}else {
			session.setAttribute("shipListCheck", false);
		}
		
		ItemVo itemVo = orderRepository.findItem(itemNo, db);
		itemVo.setFirstOption(firstOption);
		if(secondOption!=0) {
			itemVo.setSecondOption(secondOption);
		}
		itemVo.setAmount(quantity);
		int nowSale = itemVo.getSale();
		itemVo = setTotalPrice(nowSale, itemVo);
		
		list.add(itemVo);
		session.setAttribute("orderList", list);
	}
	
	
	

	public String excuteOrder(String db, Long no, List<ItemVo> list,String shipMemo, int shipNo) {
		
		String orderNum = makeOrderNum(db);
		int result = orderRepository.insertOrder(db,orderNum,no,shipMemo,shipNo);
		
		
		for (ItemVo vo :list) {
			int itemNo = vo.getNo();
			int firstOption = vo.getFirstOption();
			int secondOption = vo.getSecondOption();
			
			int amount = vo.getAmount();
			int totalPrice = vo.getTotalPrice();
			
			int stockNo = orderRepository.findStockNo(db,no,itemNo,firstOption,secondOption);
			
			
			orderRepository.insertOrderItem(db,result,stockNo,amount,totalPrice,shipMemo);
			orderRepository.updateStock(db,stockNo,amount);
			
			
			
		}
		
		return orderNum;
	}
	

		
	public ItemVo setTotalPrice(int nowSale,ItemVo temp) {
		
		
		if(nowSale !=0) {
			int nowPrice= temp.getNowPrice();
			double calSale = (nowSale * 0.01);
			int totalPrice = nowPrice - (int)(nowPrice*calSale);
			temp.setTotalPrice(totalPrice);
		}else {
			temp.setTotalPrice(temp.getNowPrice());
		}
		
		return temp;
	}


	public int insertShip(String db, Long no, Map<String, Object> map) {
		
		ShipVo vo = new ShipVo();
		
		vo.setShipName(map.get("shipName").toString());
		vo.setPhoneNumber(map.get("phoneNumber").toString());
		vo.setAddress(map.get("address").toString());
		
		
		int shipNo = orderRepository.insertShip(db,no,vo);
		
		return shipNo;
	}

	public void updateShip(String db, Long no, Map<String, Object> map) {
		
		ShipVo vo = new ShipVo();
		
		System.out.println(map);
		
		String nowNoStr = map.get("shipNo").toString();
		int nowNo = Integer.parseInt(nowNoStr);
		
		
		
		vo.setShipName(map.get("shipName").toString());
		vo.setPhoneNumber(map.get("phoneNumber").toString());
		vo.setAddress(map.get("address").toString());
		vo.setNo(nowNo);
		
		 orderRepository.updateShip(db,no,vo);
	
	}
	
	
	
	public String makeOrderNum(String db) {
		
		int recentOrderNum = orderRepository.findRecentOrderNum(db);
		recentOrderNum+=1;
		String convertNum = String.format("%04d", recentOrderNum);
		
		SimpleDateFormat nowDate = new SimpleDateFormat("yyyyMMdd"); 
		Date now = new Date();
		
		String nowDateString =nowDate.format(now);
		
		return nowDateString+"-"+convertNum;
	}


}
















