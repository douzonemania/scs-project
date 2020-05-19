package com.douzonemania.scs.repository;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
@Repository
public class TestRepository {
	    
		@Autowired
	    private SqlSession secondarySqlSession;
	   
	    public int getUserList() {
	    	
//	    		System.out.println("TEST");
//	         Long l = secondarySqlSession.selectOne("first.getList");
//	         System.out.println("SCS2 : "+ l);
//	        
//	         Long d = secondarySqlSession.selectOne("first.getTest");
//	         System.out.println("MALL:" + d);
	        
	        return secondarySqlSession.update("first.createTable");
	        
	    }
	
	
}