package com.douzonemania.scs.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.douzonemania.scs.vo.ceo.ProductStatisticsVo;
import com.douzonemania.scs.vo.ceo.ShipCompanyVo;
import com.douzonemania.scs.vo.member.BoardVo;
import com.douzonemania.scs.vo.member.CategoryVo;
import com.douzonemania.scs.vo.member.ItemBoardVo;
import com.douzonemania.scs.vo.member.ItemReplyVo;
import com.douzonemania.scs.vo.member.ItemVo;
import com.douzonemania.scs.vo.member.OptionVo;
import com.douzonemania.scs.vo.member.StockVo;

@Repository
public class ProductRepository {

	@Autowired
	private SqlSession sqlSession;

	public int listCount(String id, String option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("option", option);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("product.getItemListCount", map);
	}
	
	public List<ItemVo> getItemList(String id, int offset, int size) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("offset", offset);
		map.put("size", size);
		
		return sqlSession.selectList("product.getItemList", map);
	}

	public List<ItemVo> getSearchItemList(String id, String option, String keyword, int offset, int size) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("option", option);
		map.put("keyword", keyword);
		map.put("offset", offset);
		map.put("size", size);

		return sqlSession.selectList("product.getSearchItemList", map);
	}

	public int regItem(String id, ItemVo iVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("iVo",iVo);
		return sqlSession.insert("product.regItem", map);
	}

	public ItemVo findItem(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("no",no);
		return sqlSession.selectOne("product.findItem", map);
	}

	public int addCategory(String id, CategoryVo cVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("cVo",cVo);
		return sqlSession.insert("category.addCategory", map);
	}

	public CategoryVo findCategoryByName(String id, String name) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("name",name);
		return sqlSession.selectOne("category.findCategoryByName", map);
	}
	
	public CategoryVo findCategoryByNo(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("no", no);
		return sqlSession.selectOne("category.findCategoryByNo", map);
	}

	public int delCategory(String id, String name) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("name",name);
		return sqlSession.delete("category.delCategory", map);
	}

	public List<CategoryVo> getCategoryNameList(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		return sqlSession.selectList("category.getCategoryNameList",map);
	}

	public int updateCategory(String id, String name, String afterName) {
		Map<String, String> map = new HashMap<>();
		map.put("db",id);
		map.put("name", name);
		map.put("afterName", afterName);
		return sqlSession.update("category.updateCategory", map);
	}

	public List<CategoryVo> getCategory2NameList(String id, int parentCategoryNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("parentCategoryNo", parentCategoryNo);
		return sqlSession.selectList("category.getCategory2NameListByNo", map);
	}
	
	public List<CategoryVo> getCategory2NameList(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		return sqlSession.selectList("category.getCategory2NameList", map);
	}
	
	public int findCategoryNoByName(String id, String parentCategory) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("name", parentCategory);
		return sqlSession.selectOne("category.getCategoryNoByName", map);
	}
	
	public List<OptionVo> getOptionListOfSize(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		return sqlSession.selectList("option.getOptionListOfSize", map);
	}
	
	public List<OptionVo> getOptionListOfColor(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		return sqlSession.selectList("option.getOptionListOfColor", map);
	}
	
	public int addSizeOption(String id, String name) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("name", name);
		return sqlSession.insert("option.addSizeOption", map);
	}
	
	public int addColorOption(String id, String name) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("name", name);
		return sqlSession.insert("option.addColorOption", map);
	}
	
	public OptionVo getOption(String id, String name) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("name", name);
		return sqlSession.selectOne("option.getOption", map);
	}	
	
	public OptionVo getOptionByNo(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("no", no);
		return sqlSession.selectOne("option.getOptionByNo", map);
	}
	
	public int delOption(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("no", no);
		return sqlSession.delete("option.delOption", map);
	}
	
	public List<OptionVo> getOptionList(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);		
		return sqlSession.selectList("option.getList", map);
	}
	
	public List<ShipCompanyVo> getShipCompanyList(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);	
		return sqlSession.selectList("product.getShipCompanyList",map);
	}
	
	public int getItemNo(String id, String code) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);		
		map.put("code", code);
		return sqlSession.selectOne("product.getItemNo",map);
	}
	
	public int insertStock(String id, int itemNo, StockVo sVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);		
		map.put("sVo", sVo);
		map.put("itemNo",itemNo);
		return sqlSession.insert("product.insertStock", map);
	}
	
	public int delItem(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("no",no);
		return sqlSession.update("product.delItem", map);
	}
	
	public List<StockVo> getStockListByItemNo(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("no",no);
		return sqlSession.selectList("option.getStockListByItemNo", map);
	}

	public String getSession() {

		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpSession nowSession = attr.getRequest().getSession();		
		String id =nowSession.getAttribute("name").toString();
		return id;
	}

	public int itemBoardListCount(String id, String option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("option", option);
		map.put("keyword", keyword);

		return sqlSession.selectOne("product.itemBoardListCount", map);
	}

	public List<BoardVo> itemBoardList(String id, int offset, int size, int check) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("offset", offset);
		map.put("size", size);
		map.put("check", check);

		return sqlSession.selectList("product.itemBoardList", map);
	}

	public List<BoardVo> searchItemBoardList(String id, String option, String keyword, int offset, int size) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("option", option);
		map.put("keyword", keyword);
		map.put("offset", offset);
		map.put("size", size);

		return sqlSession.selectList("product.searchItemBoardList", map);
	}

	// board의 no(parentsNo)에 대한 답글을 insert
	public int boardReply(String id, int parentsNo, byte[] contents) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("parentsNo", parentsNo);
		map.put("contents", contents);

		return sqlSession.insert("product.insertBoardReply", map);
	}

	// item board 답글을 남겼으면 답글 상태를 true로 변경, 답글을 삭제했으면 상태를 false로 변경
	public int updateBoardReply(String id, int no, boolean state) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		map.put("state", state);
		
		return sqlSession.update("product.updateBoardReply", map);
	}

	// board 글에 남긴 답글에 대한 정보를 가져옴
	public ItemBoardVo findItemBoardByNo(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		
		return sqlSession.selectOne("product.findItemBoardByNo", map);
	}

	// 회원 이름을 가져오기 위함
	public String findNameByNo(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		
		return sqlSession.selectOne("product.findNameByNo", map);
	}

	public ItemReplyVo findItemReplyByParentsNo(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		
		return sqlSession.selectOne("product.findItemReplyByParentsNo", map);
	}

	public int deleteItemBoard(String id, int no) {

		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		
		ItemBoardVo itemBoardVo = sqlSession.selectOne("product.findItemBoardByNo", map);
		
		// 답글이 달려있으면 글을 지우지 못하도록.
		if(!itemBoardVo.isReplyState()) {
			return sqlSession.delete("product.deleteItemBoard", map);
		}
		else {
			return 0; 
		}
		
		
	}

	public int updateItem(String id, ItemVo iVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("iVo", iVo);
		return sqlSession.update("product.modItem",map);
	}

	public int delStock(String id, int itemNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("itemNo", itemNo);
		return sqlSession.delete("product.delStock",map);
	}

	public int deleteItemBoardReply(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		
		return sqlSession.delete("product.deleteItemBoardReply", map);
	}

	public List<ProductStatisticsVo> getStatisticsByItemNo(String id, int no, String date1, String date2) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		map.put("date1", date1);
		map.put("date2", date2);
		return sqlSession.selectList("product.getStatisticsByItemNo", map);
	}

	public int getShippingCharge(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		return sqlSession.selectOne("product.getShippingcharge",map);
	}












}
