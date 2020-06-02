package com.douzonemania.scs.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.douzonemania.scs.vo.ceo.ShipCompanyVo;
import com.douzonemania.scs.vo.member.CategoryVo;
import com.douzonemania.scs.vo.member.ItemVo;
import com.douzonemania.scs.vo.member.OptionVo;
import com.douzonemania.scs.vo.member.StockVo;

@Repository
public class ProductRepository {

	@Autowired
	private SqlSession sqlSession;

	public List<ItemVo> getItemList(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		return sqlSession.selectList("product.getList", map);
	}

	public int regItem(String id, ItemVo iVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("iVo",iVo);
		return sqlSession.insert("product.regItem", map);
	}

	public ItemVo findItem(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("no",no);
		return sqlSession.selectOne("product.findItem", map);
	}

	public int addCategory(String id, CategoryVo cVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("cVo",cVo);
		return sqlSession.insert("category.addCategory", map);
	}

	public CategoryVo findCategoryByName(String id, String name) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("name",name);
		return sqlSession.selectOne("category.findCategoryByName", map);
	}
	
	public CategoryVo findCategoryByNo(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("no", no);
		return sqlSession.selectOne("category.findCategoryByNo", map);
	}

	public int delCategory(String id, String name) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("name",name);
		return sqlSession.delete("category.delCategory", map);
	}

	public List<CategoryVo> getCategoryNameList(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		return sqlSession.selectList("category.getCategoryNameList",map);
	}

	public int updateCategory(String id, String name, String afterName) {
		Map<String, String> map = new HashMap<>();
		map.put("db",id);
		map.put("name", name);
		map.put("afterName", afterName);
		return sqlSession.update("category.updateCategory", map);
	}

	public List<CategoryVo> getCategory2NameList(String id, int parentCategoryNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("parentCategoryNo", parentCategoryNo);
		return sqlSession.selectList("category.getCategory2NameListByNo", map);
	}
	
	public List<CategoryVo> getCategory2NameList(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		return sqlSession.selectList("category.getCategory2NameList", map);
	}
	
	public int findCategoryNoByName(String id, String parentCategory) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("name", parentCategory);
		return sqlSession.selectOne("category.getCategoryNoByName", map);
	}
	
	public List<OptionVo> getOptionListOfSize(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		return sqlSession.selectList("option.getOptionListOfSize", map);
	}
	
	public List<OptionVo> getOptionListOfColor(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		return sqlSession.selectList("option.getOptionListOfColor", map);
	}
	
	public int addSizeOption(String id, String name) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("name", name);
		return sqlSession.insert("option.addSizeOption", map);
	}
	
	public int addColorOption(String id, String name) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("name", name);
		return sqlSession.insert("option.addColorOption", map);
	}
	
	public OptionVo getOption(String id, String name) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("name", name);
		return sqlSession.selectOne("option.getOption", map);
	}	
	
	public OptionVo getOptionByNo(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("no", no);
		return sqlSession.selectOne("option.getOptionByNo", map);
	}
	
	public int delOption(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("no", no);
		return sqlSession.delete("option.delOption", map);
	}
	
	public List<OptionVo> getOptionList(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);		
		return sqlSession.selectList("option.getList", map);
	}
	
	public List<ShipCompanyVo> getShipCompanyList(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);	
		return sqlSession.selectList("product.getShipCompanyList",map);
	}
	
	public int getItemNo(String id, String code) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);		
		map.put("code", code);
		return sqlSession.selectOne("product.getItemNo",map);
	}
	
	public int insertStock(String id, int itemNo, StockVo sVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);		
		map.put("sVo", sVo);
		map.put("itemNo",itemNo);
		return sqlSession.insert("product.insertStock", map);
	}
	
	public int delItem(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("no",no);
		return sqlSession.update("product.delItem", map);
	}
	
	public String getSession() {

		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpSession nowSession = attr.getRequest().getSession();		
		String id =nowSession.getAttribute("name").toString();
		return id;
	}













}
