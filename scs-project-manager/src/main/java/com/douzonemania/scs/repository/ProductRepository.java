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

import com.douzonemania.scs.vo.member.CategoryVo;
import com.douzonemania.scs.vo.member.ItemVo;

@Repository
public class ProductRepository {

	@Autowired
	private SqlSession sqlSession;

	public List<ItemVo> getItemList() {		
		return sqlSession.selectList("product.getList");
	}

	public int regItem(ItemVo iVo) {
		return sqlSession.insert("product.regItem", iVo);
	}

	public ItemVo findItem(int no) {
		return sqlSession.selectOne("product.findItem", no);
	}

	public int addCategory(CategoryVo cVo) {
		return sqlSession.insert("category.addCategory", cVo);
	}

	public CategoryVo findCategoryByName(String name) {
		return sqlSession.selectOne("category.findCategoryByName", name);
	}

	public int delCategory(String name) {
		return sqlSession.delete("category.delCategory", name);
	}

	public List<CategoryVo> getCategoryNameList() {
		return sqlSession.selectList("category.getCategoryNameList");
	}

	public int updateCategory(String name, String afterName) {
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("afterName", afterName);
		return sqlSession.update("category.updateCategory", map);
	}

	public List<CategoryVo> getCategory2NameList() {
		return sqlSession.selectList("category.getCategory2NameList");
	}
	
	
	
	
	
	public String getSession() {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		
		HttpSession nowSession = attr.getRequest().getSession();
		
		String id =nowSession.getAttribute("name").toString();
		
		
		return id;
	}
}
