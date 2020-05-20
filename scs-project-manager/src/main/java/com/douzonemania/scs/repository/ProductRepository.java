package com.douzonemania.scs.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzonemania.scs.vo.member.ItemVo;

@Repository
public class ProductRepository {

	@Autowired
	private SqlSession sqlSession;

	public List<ItemVo> getItemList() {		
		return sqlSession.selectList("product.getList");
	}

	public int regItem(ItemVo iVo) {
		return sqlSession.insert("product.regItem", iVo);
	}

	public ItemVo findItem(int no) {
		return sqlSession.selectOne("product.findItem", no);
	}
	
	
	
}
