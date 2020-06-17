package com.douzonemania.scs.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatisticsRepository {

	@Autowired
	private SqlSession sqlSession;
	
	
}
