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

	/* 상품 리스트 가져오기 */
	public List<ItemVo> getItemList() {
		return productRepository.getItemList();
	}

	/* 상품 등록*/
	public int regItem(ItemVo iVo) {
		return productRepository.regItem(iVo);		
	}
	
	/* 해당 no 상품 검색 */
	public ItemVo findItem(int no) {
		return productRepository.findItem(no);
	}

	/* 카테고리 추가하기 */
	public int addCategory(CategoryVo cVo) {		
		return productRepository.addCategory(cVo);		
	}

	/* 카테고리 이름으로 검색 */
	public CategoryVo findCategoryByName(String name) {
		return productRepository.findCategoryByName(name);
		}

	/* 카테고리 삭제하기 */
	public int delCategory(String name) {
		return productRepository.delCategory(name);		
	}

	/* 1차 카테고리 이름 리스트  */
	public List<CategoryVo> getCategoryNameList() {		
		return productRepository.getCategoryNameList();
	}
	
	/* 2차 카테고리 이름 리스트  */
	public List<CategoryVo> getCategory2NameList() {		
		return productRepository.getCategory2NameList();
	}

	/* 카테고리 수정하기 */
	public int updateCategory(String name, String afterName) {
		return productRepository.updateCategory(name, afterName);
		
	}
}
