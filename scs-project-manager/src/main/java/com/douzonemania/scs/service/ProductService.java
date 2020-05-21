package com.douzonemania.scs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.scs.repository.ProductRepository;
import com.douzonemania.scs.vo.member.CategoryVo;
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

	public int addCategory(CategoryVo cVo) {		
		return productRepository.addCategory(cVo);		
	}

	public CategoryVo findCategoryByName(String name) {
		return productRepository.findCategoryByName(name);
		}

	public int delCategory(String name) {
		return productRepository.delCategory(name);		
	}

	public List<CategoryVo> getCategoryNameList() {		
		return productRepository.getCategoryNameList();
	}

	public int updateCategory(String name, String afterName) {
		return productRepository.updateCategory(name, afterName);
		
	}
}
