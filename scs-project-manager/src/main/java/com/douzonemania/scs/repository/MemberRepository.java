package com.douzonemania.scs.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzonemania.scs.vo.member.MemberVo;

@Repository
public class MemberRepository {

	@Autowired
	private SqlSession sqlSession;
	
	public List<MemberVo> memberList(String id) {
		HashMap<String, String> map = new HashMap<>();
		map.put("db", id);
		return sqlSession.selectList("member.findAll", map);
	}

	public String getMemberEmail(String id, int no) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		return sqlSession.selectOne("member.getMemberEmail", map);
	}

}