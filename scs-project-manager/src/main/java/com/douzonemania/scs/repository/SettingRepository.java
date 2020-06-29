package com.douzonemania.scs.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.douzonemania.scs.vo.ceo.AgreementVo;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.ceo.ShipCompanyVo;


@Repository
public class SettingRepository {

	@Autowired
	private SqlSession sqlSession;
	
	/* ceo update */
	public int updateCeo(CeoVo ceoVo) {
	
		return sqlSession.update("user.updateCeo",ceoVo);
	}
	
	/* 약관 select */
	public AgreementVo findAgreementById(String id) {
		
		return sqlSession.selectOne("setting.findAgreementById", id);
	}
	public int insertPolicy(String id) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("firstAgree", "");
		map.put("secondAgree", "");
		map.put("thirdAgree", "");
		map.put("id", id);
		return sqlSession.insert("setting.insertPolicy", map);
	}
	
	
	/* 약관 update */
	public int updatePolicy(String contents, String agreement, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("contents", contents);
		map.put("agreement", agreement);
		map.put("id", id);
		
		
		return sqlSession.update("setting.updatePolicy", map);
	}
	
	public String getSession() {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		
		HttpSession nowSession = attr.getRequest().getSession();
		
		String id =nowSession.getAttribute("name").toString();
		
		
		return id;
	}
	
	/* 배송사 select */
	public List<ShipCompanyVo> getList(String id) {
		
		return sqlSession.selectList("setting.getList", id);
	}

	/* 배송사 insert */
	public int insertShip(ShipCompanyVo shipCompanyVo) {
	
		return sqlSession.insert("setting.insertShip", shipCompanyVo);
	}
	
	/* 배송사 count */
	public int shipCount(String id) {
		
		return sqlSession.selectOne("setting.shipCount", id);
	}

	/* 배송사 delete */
	public int deleteShip(Long no) {
		
		return sqlSession.delete("setting.deleteShip", no);
	}




}
