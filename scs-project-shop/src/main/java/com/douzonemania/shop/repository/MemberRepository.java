package com.douzonemania.shop.repository;

import java.util.HashMap;
import java.util.Map;

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
		int count =0;
		if(sqlSession.selectOne("member.findUser",map)==null) {
			count =0;
		}else {
			count=sqlSession.selectOne("member.findUser",map);
		}
		
		return count;
		
	}
	
	public String findIdByPhone(String phoneNum) {
		String db=getSession();
		map.put("db", db);
		map.put("phoneNum", phoneNum);
		return sqlSession.selectOne("member.findIdByPhone", map);
	}
	
	public String findEmailById(String id) {
		String db=getSession();
		map.put("db", db);
		map.put("id", id);
		return sqlSession.selectOne("member.findEmailById", map);
	}
	
	public int updatePassword(String id, String password) {
		String db=getSession();
		map.put("db", db);
		map.put("id", id);
		map.put("password", password);
		
		return sqlSession.update("member.updatePassword", map);
	}
	
	public String getSession() {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		
		HttpSession nowSession = attr.getRequest().getSession();
		
		String id =nowSession.getAttribute("db").toString();
		
		
		return id;
	}

	public MemberVo findUserByNo(Long no) {
		String db=getSession();
		map.put("db", db);
		map.put("no", no);
		return sqlSession.selectOne("member.findUserByNo", map);
	}

	public int modPassword(String id, String newPassword) {
		String db=getSession();
		map.put("db", db);
		map.put("id", id);
		map.put("newPassword",newPassword);
		return sqlSession.update("member.modPassword",map);
	}




	
}
