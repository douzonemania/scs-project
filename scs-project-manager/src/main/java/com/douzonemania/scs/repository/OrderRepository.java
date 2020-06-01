package com.douzonemania.scs.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzonemania.scs.vo.member.OrderSettleVo;

@Repository
public class OrderRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<OrderSettleVo> findByDate(String startDate, String endDate, String id, int offset, int size) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("offset", offset);
		map.put("size", size);
		
		return sqlSession.selectList("order.findByDate", map);
	}

	public int listCount(String startDate, String endDate, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		
		return sqlSession.selectOne("order.listCount", map); 
	}
	
	
}
