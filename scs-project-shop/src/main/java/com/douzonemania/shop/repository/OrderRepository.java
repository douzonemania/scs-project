package com.douzonemania.shop.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.douzonemania.shop.vo.CategoryVo;
import com.douzonemania.shop.vo.ItemVo;
import com.douzonemania.shop.vo.OptionVo;

@Repository
public class OrderRepository {

	@Autowired
	SqlSession sqlSession;
	
	Map<String,Object> map = new HashMap<>();
	public int totalCount(String option,String keyword,int category,int subCategory) {
		String db=getSession();
		
		map.put("option", option);
		map.put("keyword",keyword);
		map.put("category",category);
		map.put("subCategory",subCategory);
		map.put("db",db);
		
		int count = sqlSession.selectOne("order.totalCount",map);
		
		
		return count;
	}
	

	public List<ItemVo> find(int offset,String keyword,int category){
		
		String db=getSession();
		
		map.put("offset",offset);
		map.put("keyword",keyword);
		map.put("category",category);
		map.put("db",db);
		
		List<ItemVo> list = sqlSession.selectList("order.find",map);
		
		return list;
	}
	
	public List<ItemVo> calReviewAvg(List<ItemVo> list) {
		String db=getSession();
		
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
	
	public List<CategoryVo> findCategoryList(int category) {
		String db=getSession();
		
		map.put("category",category);
		map.put("db",db);
		
		List<CategoryVo> list = sqlSession.selectList("order.findCategoryList",map);
		return list;
	}
	
	public ItemVo findProduct(Integer no) {
		
		String db=getSession();
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
	
	public List<OptionVo> findOptionList(Integer no) {
		
		String db=getSession();
		map.put("db",db);
		map.put("no",no);
		
		List<OptionVo> list = sqlSession.selectList("order.findOptionList",map);
		
		for (OptionVo optionVo : list) {
			System.out.println(optionVo);
		}
		
		return list;
	}


	
	public String getSession() {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		
		HttpSession nowSession = attr.getRequest().getSession();
		String id =nowSession.getAttribute("db").toString();
		
		return id;
	}



	


	
}
