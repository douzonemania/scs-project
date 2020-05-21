package com.douzonemania.scs.repository;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.douzonemania.scs.vo.ceo.ShipCompanyVo;

@Repository
public class ShipCompanyRepository {
	
	@Autowired
	private SqlSession sqlSession;

	public List<ShipCompanyVo> getList(String id) {
		
		return sqlSession.selectList("shipcompany.getList", id);
	}

	public int insertShip(ShipCompanyVo shipCompanyVo) {
	
		return sqlSession.insert("shipcompany.insertShip", shipCompanyVo);
	}

	public int shipCount(String id) {
		
		return sqlSession.selectOne("shipcompany.shipCount", "sjy8033");
	}

	public int deleteShip(Long no) {
		
		return sqlSession.delete("shipcompany.deleteShip", no);
	}
	
	public String getSession() {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		
		HttpSession nowSession = attr.getRequest().getSession();
		
		String id =nowSession.getAttribute("name").toString();
		
		
		return id;
	}
}
