package com.douzonemania.scs.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzonemania.scs.vo.ceo.ContentsVo;
import com.douzonemania.scs.vo.ceo.CustomDesignVo;
import com.douzonemania.scs.vo.ceo.CustomVo;
import com.douzonemania.scs.vo.ceo.MainMenuVo;
import com.douzonemania.scs.vo.ceo.SubMenuVo;

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
		return sqlSession.selectOne("design.getMainMenuList", id);
	}

	public int updateMainMenu(String id, MainMenuVo mainMenuVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("mainMenuVo", mainMenuVo);
		
		return sqlSession.update("design.updateMainMenu", map);
	}

	public MainMenuVo getMainMenuList(String id) {
		
		return sqlSession.selectOne("design.getMainMenuList", id);
		
	}

	public int insertCustomMenu(int menuIndex, String name, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("menuIndex", menuIndex);
		map.put("name", name);
		
		return sqlSession.insert("design.insertCustomMenu", map);
	}

	public List<SubMenuVo> getSubMenuById(String id) {
		return sqlSession.selectList("design.getSubMenuById", id);
	}

	public int getMaxSubMenuIndex(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		
		return sqlSession.selectOne("design.getMaxSubMenuIndex", id);
	}
	
	///////////////////////
	
	public int findSubmenuNum(int index, String id) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("index",index);
		map.put("id",id);
		
		return sqlSession.selectOne("design.findSubmenuNum",map);
	}

	public int insertCustoms(CustomDesignVo vo, int submenuNum) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("customIndex",vo.getCustomIndex());
		map.put("designId",vo.getDesignID());
		map.put("submenuNum",submenuNum);
		map.put("no",0);
		sqlSession.insert("design.insertCustoms",map);
		
		return (Integer)map.get("no");
		
	}

	public int findCustoms(CustomDesignVo vo, int submenuNum) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("customIndex",vo.getCustomIndex());
		map.put("designId",vo.getDesignID());
		map.put("submenuNum",submenuNum);
	

		map = sqlSession.selectOne("design.findCustoms",map);
		int now = Integer.parseInt(map.get("no").toString());
		return now;
	}

	public void updateCustoms(CustomDesignVo vo, int submenuNum) {
		Map<String, Object> map = new HashMap<>();
		map.put("customIndex",vo.getCustomIndex());
		map.put("designId",vo.getDesignID());
		map.put("submenuNum",submenuNum);
	
		sqlSession.update("design.updateCustoms",map);
		
	}

	public int findContents(int customNo, int index) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("customNo",customNo);
		map.put("index",index);
		
		return sqlSession.selectOne("design.findContents",map);
			
	}

	public void insertContents(int index, String contents, int customNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("customNo",customNo);
		map.put("index",index);
		map.put("contents",contents);
		sqlSession.insert("design.insertContents",map);
	}

	public void updateContents(int index, String contents, int customNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("customNo",customNo);
		map.put("index",index);
		map.put("contents",contents);
		sqlSession.insert("design.updateContents",map);
		
	}

	// custom menu의 state를 false로 만들기(custom menu delete)
	public int deleteCustomMenu(String id, int index) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("index",index);
		
		return sqlSession.update("design.deleteCustomMenu", map);
	}  

	public List<CustomVo> getCustomBySubmenuNo(int no, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("no",no);
		map.put("id",id);
		
		return sqlSession.selectList("design.getCustomBySubmenuNo", map);
	}

	public List<ContentsVo> getContentsByCustomNo(int no, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("no",no);
		map.put("id",id);
		
		return sqlSession.selectList("design.getContentsByCustomNo", map);
	}

///////////////////////////////////////0619 jungeun start////////////////////////////////////////////////
	
	public int deleteQnaByIndex(int index, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("index1",index * 2 - 1);
		map.put("index2", index * 2);
		
		int customNo = sqlSession.selectOne("design.findCustomNo", id);
		map.put("customNo", customNo);
		sqlSession.delete("design.deleteQnaByIndex1", map);
		sqlSession.delete("design.deleteQnaByIndex2", map);
		
		int count = sqlSession.selectOne("design.QnaCountByCustomIndex", customNo);
		
		int start = index * 2 + 1;
		int end = count + 2;
		
		int oldIndex = 0;
		int newIndex = 0;
		for(int i = start; i <= end; i++) {
			oldIndex = i;
			newIndex = i - 2;
			map.put("oldIndex", oldIndex);
			map.put("newIndex", newIndex);
			
			System.out.println(map.get("oldIndex") + ":" + map.get("newIndex"));
			
			sqlSession.update("design.updateQnaIndex", map);
		}
		
		return 1;
	}

	
	

}
