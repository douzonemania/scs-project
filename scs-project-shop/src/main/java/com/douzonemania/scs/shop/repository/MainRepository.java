package com.douzonemania.scs.shop.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzonemania.scs.vo.MemberVo;

@Repository
public class MainRepository {
	@Autowired
	private SqlSession sqlSession;
	
	public MemberVo getList() {		
		return sqlSession.selectOne("main.getList");
	}

}
