package com.douzonemania.scs.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzonemania.scs.vo.ceo.CeoVo;

@Repository
public class MainRepository {
	@Autowired
	private SqlSession sqlSession;
	
	public CeoVo getList() {		
		return sqlSession.selectOne("main.getList");
	}

}
