package com.douzonemania.scs.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzonemania.scs.vo.ceo.CategoryBarVo;
import com.douzonemania.scs.vo.ceo.CategoryBestVo;
import com.douzonemania.scs.vo.ceo.CategoryDonutVo;
import com.douzonemania.scs.vo.ceo.CategoryLineCountVo;
import com.douzonemania.scs.vo.ceo.CategoryLineSalesVo;
import com.douzonemania.scs.vo.ceo.CategoryNewVo;
import com.douzonemania.scs.vo.ceo.CategoryNormalVo;
import com.douzonemania.scs.vo.ceo.ProductsCountVo;
import com.douzonemania.scs.vo.ceo.ProductsPaymentAmountVo;
import com.douzonemania.scs.vo.ceo.ProductsPaymentMarginVo;
import com.douzonemania.scs.vo.ceo.ProductsPriceVo;
import com.douzonemania.scs.vo.ceo.ProductsSalesVo;

@Repository
public class StatisticsRepository {

	@Autowired
	private SqlSession sqlSession;

	/* Donut */
	public List<CategoryDonutVo> findDonut(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("db", id);
		
		return sqlSession.selectList("statistics.findDonut", map);
	}
	
	/* Donut */
	public String findName(int no, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("db", id);
		
		return sqlSession.selectOne("statistics.findName", map);
	}

	/* Bar */
	public List<CategoryBarVo> findBar(String id, int categoryNo, String startDate, String endDate) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("categoryNo", categoryNo);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		return sqlSession.selectList("statistics.findBar", map);
	}
	
	/* Line Count */
	public List<CategoryLineCountVo> findLineCount(String startDate, String endDate, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("db", id);
		
		return sqlSession.selectList("statistics.findLineCount", map);
	}

	/* Line Sales */
	public List<CategoryLineSalesVo> findLineSales(String startDate, String endDate, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("db", id);
		
		return sqlSession.selectList("statistics.findLineSales", map);
	}
	
	/* Best Count */
	public List<CategoryBestVo> findBestCount(String startDate, String endDate, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("db", id);
		
		return sqlSession.selectList("statistics.findBestCount", map);
	}

	/* New Count */
	public List<CategoryNewVo> findNewCount(String startDate, String endDate, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("db", id);
		
		return sqlSession.selectList("statistics.findNewCount", map);
	}
	
	/* Normal Count */
	public List<CategoryNormalVo> findNormalCount(String startDate, String endDate, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("db", id);
		
		return sqlSession.selectList("statistics.findNormalCount", map);
	}
	
	/* Products Sales1 */
	public List<ProductsSalesVo> findSales(String startDate, String endDate, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		return sqlSession.selectList("statistics.findSales", map);
	}

	/* Products Sales2 */
	public List<ProductsPaymentAmountVo> findSales2(String startDate, String endDate, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		return sqlSession.selectList("statistics.findSales2", map);
	}
	/* Products Sales3 */
	public List<ProductsPaymentMarginVo> findSales3(String startDate, String endDate, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return sqlSession.selectList("statistics.findSales3", map);
	}

	/* Products Sales4 */
	public List<ProductsCountVo> findSales4(String startDate, String endDate, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return sqlSession.selectList("statistics.findSales4", map);
	}
	/* Products Sales5 */
	public List<ProductsPriceVo> findSales5(String startDate, String endDate, String id, int startPrice, int endPrice) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("startPrice", startPrice);
		map.put("endPrice", endPrice);
		return sqlSession.selectList("statistics.findSales5", map);
	}



	
}
