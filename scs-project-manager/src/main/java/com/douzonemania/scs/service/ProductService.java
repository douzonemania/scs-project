package com.douzonemania.scs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.scs.repository.ProductRepository;
import com.douzonemania.scs.vo.member.ItemVo;

@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;

	public List<ItemVo> getItemList() {
		return productRepository.getItemList();
	}

	public int regItem(ItemVo iVo) {
		return productRepository.regItem(iVo);		
	}

	public ItemVo findItem(int no) {
		return productRepository.findItem(no);
	}
}
