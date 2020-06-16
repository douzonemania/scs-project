package com.douzonemania.shop.repository;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Repository
public class BoardRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	public String getSession() {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		
		HttpSession nowSession = attr.getRequest().getSession();
		
		String id =nowSession.getAttribute("name").toString();
		
		
		return id;
	}

	public boolean writeQna(String title, String contents, String option, String id, String db) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("contents", contents);
		map.put("option", option);
		map.put("id", id);
		map.put("db", db);
		return sqlSession.insert("board.writeQna", map) == 1;
	}

}
