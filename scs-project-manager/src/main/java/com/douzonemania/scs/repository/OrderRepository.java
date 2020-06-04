package com.douzonemania.scs.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzonemania.scs.vo.member.OrderDeliveryVo;
import com.douzonemania.scs.vo.member.OrderSettleVo;

@Repository
public class OrderRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	/* Settle List */ 
	public List<OrderSettleVo> findSettleByDate(String startDate, String endDate, String id, int offset, int listSize) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("offset", offset);
		map.put("size", listSize);
		
		return sqlSession.selectList("order.findSettleByDate", map);
	}

	/* Settle Count */
	public int countSettleList(String startDate, String endDate, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		
		return sqlSession.selectOne("order.countSettleList", map); 
	}
	
	/* Settle 매출  */
	public int findTotalPrice(String startDate, String endDate, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		return sqlSession.selectOne("order.findTotalPrice", map); 
	}
	
	/* Settle 마진  */
	public int findTotalMargin(String startDate, String endDate, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		
		return sqlSession.selectOne("order.findTotalMargin", map);
	}
	
	/* Delivery List by date */
	public List<OrderDeliveryVo> findDeliveryByDate(String startDate, String endDate, String id, String option,
			String keyword, int offset, int listSize) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("offset", offset);
		map.put("size", listSize);
		map.put("option", option);
		map.put("keyword", keyword);
		
		return sqlSession.selectList("order.findDeliveryByDate", map);
	}
	
	/* Delivery List by no */
	public OrderDeliveryVo findDeliveryByNo(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("db", id);
		map.put("no", no);
		
		return sqlSession.selectOne("order.findDeliveryByNo", map);
	}
	
	/* Delivery Count */
	public int countDeliveryList(String startDate, String endDate, String id, String option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("db", id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("option", option);
		map.put("keyword", keyword);
		
		System.out.println(map);
		
		return sqlSession.selectOne("order.countDeliveryList", map); 
	}
	
	/* Delivery statement list */
	public String findStatement(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("db", id);
		map.put("no", no);
		
		return sqlSession.selectOne("order.findStatement", map);
	}
	
	/* Delivery statement update */
	public int updateStatus(String id, int no, String statement) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("db", id);
		map.put("no", no);
		map.put("statement", statement);
		
		System.out.println(no + " : " + statement);
		
		return sqlSession.update("order.updateStatus", map);
	}
	
	
}
