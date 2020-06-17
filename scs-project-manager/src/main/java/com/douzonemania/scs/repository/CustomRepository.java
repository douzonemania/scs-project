package com.douzonemania.scs.repository;


import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzonemania.scs.vo.ceo.ContentsVo;
import com.douzonemania.scs.vo.ceo.CustomDesignVo;

@Repository
public class CustomRepository {

	@Autowired
	private SqlSession sqlSession;
	
	public List<CustomDesignVo> getCustomDesignBySubMenu(int subMenuNo) {		
		return sqlSession.selectList("custom.getCustomDesignBySubMenu", subMenuNo);
	}

	public List<ContentsVo> getContentsByCustomNo(int customNo) {
		return sqlSession.selectList("custom.getContentsByCustomNo", customNo);
	}

}
