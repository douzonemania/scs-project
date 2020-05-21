package com.douzonemania.scs.repository;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.douzonemania.scs.vo.ceo.CeoVo;


@Repository
public class SettingRepository {

	@Autowired
	private SqlSession sqlSession;
	
	public int updateCeo(CeoVo ceoVo) {
		System.out.println("update한다?????");
		return sqlSession.update("user.updateCeo",ceoVo);
	}
	public String getSession() {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		
		HttpSession nowSession = attr.getRequest().getSession();
		
		String id =nowSession.getAttribute("name").toString();
		
		
		return id;
	}


}
