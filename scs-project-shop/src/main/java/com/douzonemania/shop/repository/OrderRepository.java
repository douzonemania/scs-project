package com.douzonemania.shop.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


import com.douzonemania.shop.vo.CartVo;
import com.douzonemania.shop.vo.CategoryVo;
import com.douzonemania.shop.vo.ItemVo;
import com.douzonemania.shop.vo.MemberVo;
import com.douzonemania.shop.vo.OptionVo;
import com.douzonemania.shop.vo.StockVo;

@Repository
public class OrderRepository {

	@Autowired
	SqlSession sqlSession;
	Map<String,Object> map = new HashMap<>();

	
	public int totalCount(String option,String keyword,int category,int subCategory,String db) {
		
		map.put("option", option);
		map.put("keyword",keyword);
		map.put("category",category);
		map.put("subCategory",subCategory);
		map.put("db",db);
		
		int count = sqlSession.selectOne("order.totalCount",map);
		
		
		return count;
	}
	

	public List<ItemVo> find(int offset,String keyword,int category,String db){
		
		
		map.put("offset",offset);
		map.put("keyword",keyword);
		map.put("category",category);
		map.put("db",db);
		
		List<ItemVo> list = sqlSession.selectList("order.find",map);
		
		return list;
	}
	
	public List<ItemVo> calReviewAvg(List<ItemVo> list,String db) {
		
		for (ItemVo itemVo : list) {
			int no = itemVo.getNo();
			map.put("no",no);
			map.put("db",db);
			
			double reviewAvg = sqlSession.selectOne("order.calReviewAvg",map);
			
			
			int conReviewAvg = (int) Math.floor(reviewAvg);
			double douRevAvg = reviewAvg-conReviewAvg;
			
			
			itemVo.setIntRevAvg(conReviewAvg);
			itemVo.setDouRevAvg(douRevAvg);
		}
		
		return list;
		
	}
	
	public List<CategoryVo> findCategoryList(int category,String db) {
		
		
		map.put("category",category);
		map.put("db",db);
		
		List<CategoryVo> list = sqlSession.selectList("order.findCategoryList",map);
		return list;
	}
	
	public ItemVo findProduct(Integer no,String db) {
		
		map.put("db",db);
		map.put("no",no);
		
		ItemVo vo =sqlSession.selectOne("order.findProduct",map);
		
		double reviewAvg = vo.getRate();
		int conReviewAvg=(int) Math.floor(reviewAvg);
		double douRevAvg = reviewAvg-conReviewAvg;
		
		vo.setIntRevAvg(conReviewAvg);
		vo.setDouRevAvg(douRevAvg);
		

		return vo;
		
		
	}
	
	public List<OptionVo> findOptionList(Integer no,String db) {
		
		
		map.put("db",db);
		map.put("no",no);
		
		List<OptionVo> list = sqlSession.selectList("order.findOptionList",map);
	
		
		return list;
	}

	public List<OptionVo> findSecondOption(int no, int option,String db) {
		
		map.put("db",db);
		map.put("no",no);
		map.put("option",option);
		
		List<OptionVo> list = sqlSession.selectList("order.findSecondOption",map);
		
		return list;
	}

	public CartVo checkAmount(int no, int firstOption, int secondOption,String db,long memberNo) {
		
		map.put("db",db);
		map.put("memberNo",memberNo);
		map.put("firstOption",firstOption);
		map.put("secondOption",secondOption);
		map.put("itemNo",no);
		map.put("memberNo",memberNo);
		
		CartVo result = sqlSession.selectOne("order.checkCart",map);
		
		return result;
	}


	public void insertCart(long memberNo,  int quantity,int stockNo,String db) {
		
		map.put("db",db);
		map.put("memberNo",memberNo);
		map.put("amount",quantity);
		map.put("stockNo",stockNo);
		sqlSession.insert("order.insertCart",map);
		
		
	}


	public int getStockNo(int no, int firstOption, int secondOption,String db) {
		
		map.put("db",db);
		map.put("firstOption",firstOption);
		map.put("secondOption",secondOption);
		map.put("itemNo",no);
		
		int stockNo  = sqlSession.selectOne("order.findStockNo",map);
		
		return stockNo;
	}


	public void updateCart(String db,int cartNo,int checkAmount) {
		
		
		map.put("db",db);
		map.put("amount",checkAmount);
		map.put("cartNo",cartNo);
		
		sqlSession.update("order.updateCart",map);
		
	}

	public List<ItemVo> setCartList(String db, long memberNo) {
		
		map.put("db",db);
		map.put("memberNo",memberNo);
		
		List<ItemVo> list = sqlSession.selectList("order.setCartList",map);
		
		
		return list;
	}


	public void deleteCart(String db, Long long1, int cartNo) {
		
		map.put("db", db);
		map.put("userNo",long1);
		map.put("cartNo",cartNo);
		
		sqlSession.delete("order.deleteCart",map);
		
		
	}
	
	public void deleteCartAll(String db, Long no) {
		map.put("db", db);
		map.put("userNo",no);
		
		sqlSession.delete("order.deleteCartAll",map);
		
	}

	public ItemVo setOrderItem(String db, Long no, Integer cartNo) {
		
		System.out.println("DB:"+db+"/USERNO:"+no+"/CARTNO"+cartNo);
		
		map.put("db", db);
		map.put("userNo",no);
		map.put("cartNo",cartNo);
		
		ItemVo temp = sqlSession.selectOne("order.findOrderItem",map);
		return temp;
	}


	


	
}
