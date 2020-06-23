package com.douzonemania.shop.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzonemania.shop.vo.CategoryVo;
import com.douzonemania.shop.vo.ContentsVo;
import com.douzonemania.shop.vo.CustomDesignVo;
import com.douzonemania.shop.vo.ItemVo;
import com.douzonemania.shop.vo.SubMenuVo;

@Repository
public class CustomRepository {

	@Autowired
	SqlSession sqlSession;
	Map<String, Object> map = new HashMap<>();

	public int bestTotalCount(String option, String keyword, int category, int subCategory, String db) {

		map.put("option", option);
		map.put("keyword", keyword);
		map.put("category", category);
		map.put("subCategory", subCategory);
		map.put("db", db);

		int count = sqlSession.selectOne("custom.bestTotalCount", map);

		return count;
	}
	
	public int newTotalCount(String option, String keyword, int category, int subCategory, String db) {

		map.put("option", option);
		map.put("keyword", keyword);
		map.put("category", category);
		map.put("subCategory", subCategory);
		map.put("db", db);

		int count = sqlSession.selectOne("custom.newTotalCount", map);

		return count;
	}
	
	public int saleTotalCount(String option, String keyword, int category, int subCategory, String db) {

		map.put("option", option);
		map.put("keyword", keyword);
		map.put("category", category);
		map.put("subCategory", subCategory);
		map.put("db", db);

		int count = sqlSession.selectOne("custom.saleTotalCount", map);

		return count;
	}

	public List<ItemVo> bestFind(int offset, String keyword, int category, String db) {

		map.put("offset", offset);
		map.put("keyword", keyword);
		map.put("category", category);
		map.put("db", db);

		List<ItemVo> list = sqlSession.selectList("custom.findBest", map);

		return list;
	}

	
	public List<ItemVo> newFind(int offset, String keyword, int category, String db) {

		map.put("offset", offset);
		map.put("keyword", keyword);
		map.put("category", category);
		map.put("db", db);

		List<ItemVo> list = sqlSession.selectList("custom.findNew", map);

		return list;
	}
	
	public List<ItemVo> saleFind(int offset, String keyword, int category, String db) {

		map.put("offset", offset);
		map.put("keyword", keyword);
		map.put("category", category);
		map.put("db", db);

		List<ItemVo> list = sqlSession.selectList("custom.findSale", map);

		return list;
	}

	
	public List<ItemVo> calReviewAvg(List<ItemVo> list, String db) {

		for (ItemVo itemVo : list) {
			int no = itemVo.getNo();
			map.put("no", no);
			map.put("db", db);

			double reviewAvg = sqlSession.selectOne("order.calReviewAvg", map);

			int conReviewAvg = (int) Math.floor(reviewAvg);
			double douRevAvg = reviewAvg - conReviewAvg;

			itemVo.setIntRevAvg(conReviewAvg);
			itemVo.setDouRevAvg(douRevAvg);
		}

		return list;

	}

	public List<CategoryVo> findCategoryList(int category, String db) {

		map.put("category", category);
		map.put("db", db);

		List<CategoryVo> list = sqlSession.selectList("order.findCategoryList", map);
		return list;
	}
	
	public List<CustomDesignVo> getCustomDesignBySubMenu(int subMenuNo) {		
		return sqlSession.selectList("custom.getCustomDesignBySubMenu", subMenuNo);
	}

	public List<ContentsVo> getContentsByCustomNo(int customNo) {
		return sqlSession.selectList("custom.getContentsByCustomNo", customNo);
	}
	
	public List<SubMenuVo> getSubMenuById(String id) {
		return sqlSession.selectList("custom.getSubMenuById", id);
	}

	public int findSubMenuNo(String db,int no) {
	
		map.put("no", no);
		map.put("db", db);
		
		return sqlSession.selectOne("custom.findSubMenuNo",map);
	}
	
	public int getCustomNo(int index, String id) {
		map.put("index", index);
		map.put("db", id);
		
		return sqlSession.selectOne("custom.getCustomNo", map);
	}
}
