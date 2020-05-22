package com.douzonemania.scs.repository;

import java.util.List;

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
	
	// ceo 없데이트
	public int updateCeo(CeoVo ceoVo) {
		System.out.println("update한다?????");
		return sqlSession.update("user.updateCeo",ceoVo);
	}
	
	// id로 agreement 찾기
	public AgreementVo findAgreementById(String id) {
		System.out.println("agreement 찾는다?");
		return sqlSession.selectOne("setting.findAgreementById", id);
	}
	
	public String getSession() {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		
		HttpSession nowSession = attr.getRequest().getSession();
		
		String id =nowSession.getAttribute("name").toString();
		
		
		return id;
	}

	public List<ShipCompanyVo> getList(String id) {
		
		return sqlSession.selectList("setting.getList", id);
	}

	public int insertShip(ShipCompanyVo shipCompanyVo) {
	
		return sqlSession.insert("setting.insertShip", shipCompanyVo);
	}

	public int shipCount(String id) {
		
		return sqlSession.selectOne("setting.shipCount", "sjy8033");
	}

	public int deleteShip(Long no) {
		
		return sqlSession.delete("setting.deleteShip", no);
	}


}
