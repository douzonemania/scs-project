package com.douzonemania.shop.repository;

import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.douzonemania.shop.vo.MemberVo;


@Repository
public class MemberRepository {

	@Autowired
	SqlSession sqlSession;
	
	HashMap<String, Object> map = new HashMap<String, Object>();

	public boolean existUser(String id) {
		
		String db=getSession();
		
		map.put("db", db);
		map.put("id", id);
		
		int result =sqlSession.selectOne("member.existUser",map);
		
		return result==1;
	}
	
	public void insertUser(@Valid MemberVo vo) {
	
		String db=getSession();
		
		map.put("db",db);
		map.put("vo",vo);
		
		sqlSession.insert("member.insertUser",map);
		
	}
	

	public int findUser(@Valid MemberVo vo) {
		
		String db=getSession();
		map.put("db",db);
		map.put("vo",vo);
		
		int count =sqlSession.selectOne("member.findUser",map);
		
		return count;
		
	}
	public String getSession() {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		
		HttpSession nowSession = attr.getRequest().getSession();
		
		String id =nowSession.getAttribute("db").toString();
		
		
		return id;
	}


	
}
