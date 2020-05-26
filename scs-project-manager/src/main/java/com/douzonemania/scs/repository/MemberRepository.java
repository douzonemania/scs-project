package com.douzonemania.scs.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzonemania.scs.vo.member.MemberVo;

@Repository
public class MemberRepository {

	@Autowired
	private SqlSession sqlSession;
	
	public List<MemberVo> memberList(String id, int offset, int size) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("offset", offset);
		map.put("size", size);
		
		return sqlSession.selectList("member.findAll", map);
	}

	public String getMemberEmail(String id, int no) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		return sqlSession.selectOne("member.getMemberEmail", map);
	}

	public List<MemberVo> searchMemberList(String id, String option, String keyword
									, int offset, int size) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("option", option);
		map.put("keyword", keyword);
		map.put("offset", offset);
		map.put("size", size);
		
		return sqlSession.selectList("member.findSearchList", map);

	}
	
	public int listCount(String id, String option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("option", option);
		map.put("keyword", keyword);
		return sqlSession.selectOne("member.listCount", map); 
	}
	

}