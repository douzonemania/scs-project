package com.douzonemania.scs.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzonemania.scs.vo.ceo.MainMenuVo;

@Repository
public class DesignRepository {

	@Autowired
	private SqlSession sqlSession;

	public int insertMainMenu(String id, MainMenuVo mainMenuVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("mainMenuVo", mainMenuVo);
		
		return sqlSession.insert("design.insertMainMenu", map);
	}

	public MainMenuVo checkInsertOrUpdate(String id) {
		return sqlSession.selectOne("design.checkInsertOrUpdate", id);
	}

	public int updateMainMenu(String id, MainMenuVo mainMenuVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("mainMenuVo", mainMenuVo);
		
		return sqlSession.update("design.updateMainMenu", map);
	}

}
