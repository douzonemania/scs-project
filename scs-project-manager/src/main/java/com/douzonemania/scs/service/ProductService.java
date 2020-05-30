package com.douzonemania.scs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.scs.repository.ProductRepository;
import com.douzonemania.scs.vo.member.CategoryVo;
import com.douzonemania.scs.vo.member.ItemVo;
import com.douzonemania.scs.vo.member.OptionVo;

@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;

	/* 상품 리스트 가져오기 */
	public List<ItemVo> getItemList(String id) {
		return productRepository.getItemList(id);
	}

	/* 상품 등록*/
	public int regItem(String id, ItemVo iVo) {
		return productRepository.regItem(id, iVo);		
	}
	
	/* 해당 no 상품 검색 */
	public ItemVo findItem(String id, int no) {
		return productRepository.findItem(id, no);
	}

	/* 카테고리 추가하기 */
	public int addCategory(String id, CategoryVo cVo) {		
		return productRepository.addCategory(id, cVo);		
	}

	/* 카테고리 이름으로 검색 */
	public CategoryVo findCategoryByName(String id, String name) {
		return productRepository.findCategoryByName(id, name);
		}

	/* 카테고리 삭제하기 */
	public int delCategory(String id, String name) {
		return productRepository.delCategory(id, name);		
	}

	/* 1차 카테고리 이름 리스트  */
	public List<CategoryVo> getCategoryNameList(String id) {		
		return productRepository.getCategoryNameList(id);
	}
	
	/* 2차 카테고리 부모카테고리번호 별 이름 리스트  */
	public List<CategoryVo> getCategory2NameList(String id, int parentCategoryNo) {		
		return productRepository.getCategory2NameList(id, parentCategoryNo);
	}
	/* 2차 카테고리 전체 이름 리스트 */ 
	public List<CategoryVo> getCategory2NameList(String id) {
		return productRepository.getCategory2NameList(id);
	}
	
	/* 카테고리 수정하기 */
	public int updateCategory(String id, String name, String afterName) {
		return productRepository.updateCategory(id, name, afterName);
		
	}
	/* 카테고리 추가시 카테고리 이름으로 부모 카테고리 번호 검색 */
	public int getCategoryNoByName(String id, String parentCategory) {
		return productRepository.findCategoryNoByName(id, parentCategory);		
	}

	public List<OptionVo> getOptionListOfSize(String id) {
		return productRepository.getOptionListOfSize(id);
	}
	
	public List<OptionVo> getOptionListOfColor(String id) {
		return productRepository.getOptionListOfColor(id);
	}

	public int addSizeOption(String id, String name) {
		return productRepository.addSizeOption(id, name);
	}

	public int addColorOption(String id, String name) {
		return productRepository.addColorOption(id, name);
	}

	public OptionVo getOption(String id, String name) {
		return productRepository.getOption(id, name);
	}
	
	public OptionVo getOptionByNo(String id, int no) {
		return productRepository.getOptionByNo(id, no);
	}

	public int delOption(String id, int no) {
		return productRepository.delOption(id, no);
	}

	public List<OptionVo> getOptionList(String id) {
		return productRepository.getOptionList(id);
	}

	

}
