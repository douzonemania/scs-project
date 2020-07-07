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
import com.douzonemania.shop.vo.CeoVo;
import com.douzonemania.shop.vo.MainMenuVo;
import com.douzonemania.shop.vo.MemberVo;

@Repository
public class MainRepository {
	@Autowired
	private SqlSession sqlSession;
	
	Map<String,Object> map = new HashMap<>();
	
	public MemberVo getList() {		
		return sqlSession.selectOne("main.getList");
	}

	public List<CategoryVo> getCategoryList() {
		
		String db=getSession();
		map.put("db", db);
		return sqlSession.selectList("main.getCategoryList",map);	
	}
	
	public int getCartCnt(Long no) {
		
		String db=getSession();
		map.put("db",db);
		map.put("no",no);
		
		return sqlSession.selectOne("main.getCartCnt",map);
	}
	
	public MainMenuVo getMainMenu() {
		String db=getSession();
		map.put("db", db);
		return sqlSession.selectOne("main.getMainMenu",map);
	}

	public CeoVo getCeoVo(String id) {
		String db=getSession();
		map.put("db", db);
		return sqlSession.selectOne("main.getCeoVo",map);
	}
	
	public String getSession() {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		
		HttpSession nowSession = attr.getRequest().getSession();
		String id =nowSession.getAttribute("db").toString();
		
		return id;
	}
}
