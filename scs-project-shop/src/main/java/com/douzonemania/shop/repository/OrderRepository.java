package com.douzonemania.shop.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


import com.douzonemania.shop.vo.CartVo;
import com.douzonemania.shop.vo.CategoryVo;
import com.douzonemania.shop.vo.ItemVo;
import com.douzonemania.shop.vo.MemberVo;
import com.douzonemania.shop.vo.OptionVo;
import com.douzonemania.shop.vo.OrderListVo;
import com.douzonemania.shop.vo.ReviewVo;
import com.douzonemania.shop.vo.ShipVo;
import com.douzonemania.shop.vo.StockVo;

@Repository
public class OrderRepository {

	@Autowired
	SqlSession sqlSession;
	Map<String,Object> map = new HashMap<>();

	
	public int totalCount(String option,String keyword,int category,int subCategory,String db) {
		
		map.put("option", option);
		map.put("keyword",keyword);
		map.put("category",category);
		map.put("subCategory",subCategory);
		map.put("db",db);
		
		int count = sqlSession.selectOne("order.totalCount",map);
		
		
		return count;
	}
	

	public List<ItemVo> find(int offset,String keyword,int category,String db){
		
		
		map.put("offset",offset);
		map.put("keyword",keyword);
		map.put("category",category);
		map.put("db",db);
		
		List<ItemVo> list = sqlSession.selectList("order.find",map);
		
		return list;
	}
	
	public List<ItemVo> calReviewAvg(List<ItemVo> list,String db) {
		
		for (ItemVo itemVo : list) {
			int no = itemVo.getNo();
			map.put("no",no);
			map.put("db",db);
			
			double reviewAvg = sqlSession.selectOne("order.calReviewAvg",map);
			
			
			int conReviewAvg = (int) Math.floor(reviewAvg);
			double douRevAvg = reviewAvg-conReviewAvg;
			
			
			itemVo.setIntRevAvg(conReviewAvg);
			itemVo.setDouRevAvg(douRevAvg);
		}
		
		return list;
		
	}
	
	public List<CategoryVo> findCategoryList(int category,String db) {
		
		
		map.put("category",category);
		map.put("db",db);
		
		List<CategoryVo> list = sqlSession.selectList("order.findCategoryList",map);
		return list;
	}
	
	public ItemVo findProduct(Integer no,String db) {
		
		map.put("db",db);
		map.put("no",no);
		
		ItemVo vo =sqlSession.selectOne("order.findProduct",map);
		
		double reviewAvg = vo.getRate();
		int conReviewAvg=(int) Math.floor(reviewAvg);
		double douRevAvg = reviewAvg-conReviewAvg;
		
		vo.setIntRevAvg(conReviewAvg);
		vo.setDouRevAvg(douRevAvg);
		

		return vo;
		
		
	}
	
	public List<OptionVo> findOptionList(Integer no,String db) {
		
		
		map.put("db",db);
		map.put("no",no);
		
		List<OptionVo> list = sqlSession.selectList("order.findOptionList",map);
	
		
		return list;
	}

	public List<OptionVo> findSecondOption(int no, int option,String db) {
		
		map.put("db",db);
		map.put("no",no);
		map.put("option",option);
		
		List<OptionVo> list = sqlSession.selectList("order.findSecondOption",map);
		
		return list;
	}

	public CartVo checkAmount(int no, int firstOption, int secondOption,String db,long memberNo) {
		
		System.out.println("NO:"+memberNo+" FIRSTOPTION : "+firstOption +" secondOption :"+secondOption +" itemno:"+no  +" memberno:"+memberNo);
		
		map.put("db",db);
		map.put("memberNo",memberNo);
		map.put("firstOption",firstOption);
		map.put("secondOption",secondOption);
		map.put("itemNo",no);
		map.put("memberNo",memberNo);
		
		CartVo result = sqlSession.selectOne("order.checkCart",map);
		
		return result;
	}


	public void insertCart(long memberNo,  int quantity,int stockNo,String db) {
		
		map.put("db",db);
		map.put("memberNo",memberNo);
		map.put("amount",quantity);
		map.put("stockNo",stockNo);
		sqlSession.insert("order.insertCart",map);
		
		
	}


	public int getStockNo(int no, int firstOption, int secondOption,String db) {
		
		map.put("db",db);
		map.put("firstOption",firstOption);
		map.put("secondOption",secondOption);
		map.put("itemNo",no);
		
		int stockNo  = sqlSession.selectOne("order.findStockNo",map);
		
		return stockNo;
	}


	public void updateCart(String db,int cartNo,int checkAmount) {
		
		
		map.put("db",db);
		map.put("amount",checkAmount);
		map.put("cartNo",cartNo);
		
		sqlSession.update("order.updateCart",map);
		
	}

	public List<ItemVo> setCartList(String db, long memberNo) {
		
		map.put("db",db);
		map.put("memberNo",memberNo);
		
		List<ItemVo> list = sqlSession.selectList("order.setCartList",map);
		
		
		return list;
	}


	public void deleteCart(String db, Long long1, int cartNo) {
		
		map.put("db", db);
		map.put("userNo",long1);
		map.put("cartNo",cartNo);
		
		sqlSession.delete("order.deleteCart",map);
		
		
	}
	
	public void deleteCartAll(String db, Long no) {
		map.put("db", db);
		map.put("userNo",no);
		
		sqlSession.delete("order.deleteCartAll",map);
		
	}

	public ItemVo setOrderItem(String db, Long no, Integer cartNo) {
		
		map.put("db", db);
		map.put("userNo",no);
		map.put("cartNo",cartNo);
		
		ItemVo temp = sqlSession.selectOne("order.findOrderItem",map);
		return temp;
	}


	public List<ShipVo> findShipAddressList(String db, Long no) {
		
		map.put("db", db);
		map.put("memberNo",no);
		
		List<ShipVo> list = sqlSession.selectList("findShipAddressList",map);
		
		
	
		return list;
	}

	
	public Integer findStockNo(String db , long no,int itemNo, int firstOption, int secondOption) {
		
		map.put("db",db);
		map.put("userNo",no);
		map.put("itemNo",itemNo);
		map.put("firstOption",firstOption);
		map.put("secondOption",secondOption);
		
	
		
		int stockNo = sqlSession.selectOne("findStockNo",map);
		
		return stockNo;	
	}

	public int findRecentOrderNum(String db) {
		
		map.put("db",db);	
		int orderNum = sqlSession.selectOne("findRecentOrderNum",map);
		return orderNum;	
	}


	public int insertOrder(String db, String orderNum, Long no,String shipMemo, int shipNo) {
		
		map.put("db",db);
		map.put("orderNum",orderNum);
		map.put("userNo",no);
		map.put("no",0);
		map.put("shipMemo",shipMemo);
		map.put("shipNo", shipNo);
		sqlSession.insert("insertOrder",map);
		int result=(Integer)map.get("no");
	
		
		return result;
	}


	public void insertOrderItem(String db, int orderNo, int stockNo,int amount,int totalPrice,String shipMemo) {
		
		map.put("db",db);
		map.put("orderNum",orderNo);
		map.put("stockNo",stockNo);
		map.put("amount",amount);
		map.put("totalPrice",totalPrice);
		
		sqlSession.insert("insertOrderItem",map);
		
	}


	public int insertShip(String db, Long no, ShipVo vo) {
		
		map.put("db",db);
		map.put("userNo",no);
		map.put("vo",vo);
		map.put("no",0);
		
		sqlSession.update("clearShip",map);
		sqlSession.insert("insertShip",map);
		int result=(Integer)map.get("no");
		
		return result;
	}


	public void updateShip(String db, long no, ShipVo vo) {
		
		map.put("db",db);
		map.put("vo",vo);
		map.put("no",no);
		
		System.out.println(db+"//"+vo.toString()+"//"+no);
		
		
		sqlSession.update("clearShip",map);
		sqlSession.update("updateShip",map);
		
		
		
		
	}


	public void updateStock(String db, int stockNo, int amount) {
		
		map.put("db",db);
		map.put("stockNo",stockNo);
		map.put("amount",amount);
		
		sqlSession.update("updateStock",map);
	}


	public ItemVo findItem(int itemNo, String db) {
		
		map.put("db",db);
		map.put("itemNo",itemNo);
		
		return sqlSession.selectOne("findItem",map);
	}


	public List<OrderListVo> getOrderList(String db, long no) {
		map.put("db",db);
		map.put("no",no);
		return sqlSession.selectList("order.getOrderList", map);
	}
	
	
	  public List<OrderListVo> getOrderListByStatemnet(String db, Long no, String
	  statement) { map.put("db",db); map.put("no",no);
	  map.put("statement",statement);
	  
	  return sqlSession.selectList("order.getOrderListByStatement", map); }
	 
	
	public List<OrderListVo> getOrderListByStatemnet(String db, Long no, String statement, String date1, String date2) {
		map.put("db",db);
		map.put("no",no);
		map.put("statement",statement);
		map.put("date1", date1);
		map.put("date2", date2);
		return sqlSession.selectList("order.getOrderListByStatementAndDate", map);
	}


	public int ConvertOption(String db, List<OrderListVo> oVo) {
		map.put("db",db);
		for(int i=0; i<oVo.size(); i++) {
			map.put("no",oVo.get(i).getColor());
			String tempColor = sqlSession.selectOne("order.convertOpiton", map);
			map.put("no",oVo.get(i).getSize());
			String tempSize = sqlSession.selectOne("order.convertOpiton", map);
			oVo.get(i).setSize(tempSize);
			oVo.get(i).setColor(tempColor);			
		}
		return 0;
	}


	public List<Integer> getCountStatement(String db, List<OrderListVo> oVo) {
		String[] statementArr = {"주문완료", "입금완료", "배송준비중", "배송중", "배송완료", "취소처리중", "교환처리중", "환불처리중","처리완료"};
		List<Integer> stList = new ArrayList<>();
		map.put("db",db);
		for(int i=0; i<statementArr.length; i++) {
			map.put("statement", statementArr[i]);
			int temp = sqlSession.selectOne("order.getCountStatement", map);
			stList.add(temp);
		}
		return stList;
	}


	public int regReview(String db, ReviewVo rVo) {
		map.put("db", db);
		map.put("rVo", rVo);
		return sqlSession.insert("order.regReview", map);
	}


	public List<ReviewVo> getReviewList(Integer no, String db) {
		map.put("db", db);
		map.put("no", no);
		return sqlSession.selectList("order.getReviewList", map);
	}


	public int updateReState(String db, int stockNo, String orderNo) {
		map.put("db", db);
		map.put("stockNo", stockNo);
		map.put("orderNo", orderNo);
		return sqlSession.update("order.updateReState", map);
	}


	public List<Integer> getRestate(String db, List<OrderListVo> oVo) {
		List<Integer> restateList = new ArrayList<>();
		map.put("db", db);
		for(int i=0; i<oVo.size(); i++) {
			int orderNo = oVo.get(i).getOrderNoPrime();
			String stockNo = oVo.get(i).getStockNo();
			map.put("orderNo", orderNo);
			map.put("stockNo", stockNo);
			int restate = sqlSession.selectOne("order.getRestate", map);
			restateList.add(restate);
		}
		return restateList;
	}




	
	


	
}
