package com.douzonemania.scs.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzonemania.scs.vo.member.ItemReviewVo;
import com.douzonemania.scs.vo.member.MemberVo;
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
		
		
		
		return sqlSession.update("order.updateStatus", map);
	}

	public int reviewListCount(String id, String option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("db", id);
		map.put("option", option);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("order.reviewListCount", map);
	}

	public List<ItemReviewVo> reviewList(String id, int offset, int listSize) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("offset", offset);
		map.put("size", listSize);
		
		return sqlSession.selectList("order.reviewList", map);
	}
	
	public List<ItemReviewVo> searchReviewList(String id, String option, 
			String keyword, int offset, int size) {

		Map<String, Object> map = new HashMap<>();
		
		map.put("db", id);
		map.put("option", option);
		map.put("keyword", keyword);
		map.put("offset", offset);
		map.put("size", size);
		
		return sqlSession.selectList("order.searchReviewList", map);

	}

	public String getItemNoByName(String id, String keyword) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("db", id);
		map.put("name", keyword);
		
		return sqlSession.selectOne("order.getItemNoByName", map);
	}

	public ItemReviewVo getReviewByNo(int no, String db) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("no", no);
		map.put("db", db);
		
		return sqlSession.selectOne("order.getReviewByNo", map);
	}

	public int deleteReview(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("no", no);
		map.put("db", id);
		
		return sqlSession.delete("order.delteReview", map);
	}
}
