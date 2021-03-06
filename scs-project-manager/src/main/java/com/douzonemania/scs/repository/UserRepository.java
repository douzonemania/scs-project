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

import com.douzonemania.scs.vo.ceo.AgreementVo;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.ceo.MainStatementVo;
import com.douzonemania.scs.vo.ceo.SiteVo;
@Repository
public class UserRepository {
   @Autowired
   private SqlSession sqlSession;
  
	// create table
	public void createTable(String id) {
		String itemReviewQry = "CREATE TABLE " + id + ".item_review(" + "   no INT UNSIGNED NOT NULL AUTO_INCREMENT,"
				+ "    rate INT UNSIGNED NOT NULL," + "    title VARCHAR(30)  NOT NULL," + "    content TEXT NOT NULL,"
				+ "    image VARCHAR(50)  NULL," + "    item_no INT UNSIGNED NULL," + "    member_no INT UNSIGNED NULL,"
				+ "    reg_date    DATETIME          NOT NULL, " + "    color    VARCHAR(20)     NULL, "
				+ "    size    VARCHAR(20)     NULL, "
				+ "    primary key(no)" + ")engine=InnoDB character set=utf8;";
		String itemBoardQry = "CREATE TABLE " + id + ".item_board(" + "    no INT UNSIGNED NOT NULL  AUTO_INCREMENT,"
				+ "    title VARCHAR(50)  NOT NULL," + "    contents  LONGBLOB         NOT NULL,"
				+ "    reg_date    DATETIME          NOT NULL, "
				+ "    member_no INT UNSIGNED NULL," + "    item_no   INT UNSIGNED NULL,"
				+ "	   reply_state BOOLEAN NOT NULL," + "    primary key(no)" + ")engine=InnoDB character set=utf8;";
		String categoryQry = "CREATE TABLE " + id + ".category(" + "    no INT UNSIGNED NOT NULL AUTO_INCREMENT,"
				+ "    name VARCHAR(50)  NOT NULL," + "    parents_no INT UNSIGNED NULL," + "    primary key(no)"
				+ ") engine=InnoDB character set=utf8; ";
		String stockQry = "CREATE TABLE " + id + ".stock(" + "    no            INT UNSIGNED NOT NULL AUTO_INCREMENT,"
				+ "    item_no       INT UNSIGNED NULL," + "    first_option  INT UNSIGNED NULL,"
				+ "    second_option INT UNSIGNED NULL," + "    stock         INT UNSIGNED NULL,"
				+ "    primary key(no)" + ") engine=InnoDB character set=utf8; ";
		String optionQry = "CREATE TABLE " + id + ".option(" + "    no INT UNSIGNED NOT NULL AUTO_INCREMENT,"
				+ "    name VARCHAR(30)  NOT NULL," + "    type VARCHAR(30) NOT NULL,"
				+ "    primary key(no)" + ") engine=InnoDB character set=utf8;";
		String memberQry = "CREATE TABLE " + id + ".member ("
				+ "    no           INT UNSIGNED  NOT NULL AUTO_INCREMENT," + "    id           VARCHAR(20)   NOT NULL,"
				+ "    name         VARCHAR(20)   NOT NULL,"
				+ "    password     VARCHAR(50)   NOT NULL," + "    phone_number VARCHAR(30)   NOT NULL,"
				+ "    email        VARCHAR(50)   NOT NULL," + "    reg_date     DATETIME          NOT NULL,"
				+ "    state		ENUM('회원', '탈퇴')	NOT NULL,"
				+ "    type         ENUM('카카오', '구글', '네이버', '일반') NOT NULL," + "    primary key(no)\r\n"
				+ ") engine=InnoDB character set=utf8; ";
		String replyQry = "CREATE TABLE " + id + ".reply(" + "   no INT UNSIGNED NOT NULL AUTO_INCREMENT,"
				+ "   parents_no INT UNSIGNED NOT NULL," + "	contents LONGBLOB NOT NULL,"
				+ "    reg_date    DATETIME          NOT NULL, "
				+ "   primary key(no)" + ") engine=InnoDB character set=utf8;";
		String orderItemQry = "CREATE TABLE " + id + ".order_item(" + "    order_no INT UNSIGNED NULL,"
				+ "    stock_no INT UNSIGNED NULL," + "	amount INT UNSIGNED NOT NULL, "
				+"	   total_price INT UNSIGNED NOT NULL," + "	re_state BOOLEAN NOT NULL "
				+ ") engine=InnoDB character set=utf8;";
		String orderQry = "CREATE TABLE " + id + ".shop_order("
				+ "    no           INT UNSIGNED NOT NULL AUTO_INCREMENT ," + "    order_number VARCHAR(20)  NOT NULL, "
				+ "    reg_date    DATETIME          NOT NULL, "
				+ "    statement    ENUM('주문완료', '입금완료', '배송준비중', '배송중', '배송완료', '취소처리중', '교환처리중', '환불처리중', '처리완료') NOT NULL,"
				+ "    member_no    INT UNSIGNED NULL ," + "ship_no INT UNSIGNED NULL," + "ship_memo VARCHAR(50) NULL,"
				+ "    primary key(no)"
				+ ") engine=InnoDB character set=utf8;";
		String boardQry = "CREATE TABLE " + id + ".board(" + "    no        INT UNSIGNED NOT NULL AUTO_INCREMENT,"
				+ "    category  ENUM('주문', '배송', '교환환불취소', '기타') NOT NULL," + "    title     VARCHAR(50)  NOT NULL ,"
				+ "    contents  LONGBLOB         NOT NULL," + "    member_no INT UNSIGNED NULL,"
				+ "    reg_date  DATETIME         NOT NULL," + "    reply_state  BOOLEAN NOT NULL," + "    primary key(no)"
				+ ") engine=InnoDB character set=utf8; ";
		String cartQry = "CREATE TABLE " + id + ".cart(" + "    no        INT UNSIGNED NOT NULL AUTO_INCREMENT,"
				+ "    amount    INT UNSIGNED NOT NULL ," + "    member_no INT UNSIGNED NULL    ,"
				+ "    stock_no  INT UNSIGNED NULL   ," + "    primary key(no)"
				+ ") engine=InnoDB character set=utf8; ";
		String itemQry = "CREATE TABLE " + id + ".item (" + "    no          INT UNSIGNED NOT NULL AUTO_INCREMENT ,"
				+ "    code        VARCHAR(50)  NOT NULL," + "    name        VARCHAR(50)  NOT NULL,"
				+ "    sup_price   INT UNSIGNED NOT NULL," + "    now_price   INT UNSIGNED NOT NULL,"
				+ "    sale        INT UNSIGNED NOT NULL," + "    main_image  VARCHAR(100) NOT NULL,"
				+ "    sub_image   VARCHAR(300) NULL," + "    visible     BOOLEAN      NOT NULL,"
				+ "    best_item        BOOLEAN      NOT NULL," + "    new_item         BOOLEAN      NOT NULL,"
				+ "    editor      LONGBLOB         NULL," + "    category_no INT UNSIGNED NULL," 
				+ "    description TEXT         NULL," + "    reg_date    DATETIME     NOT NULL,"
				+ "    ship_company    VARCHAR(30)   NOT NULL," + "    ship_charge    INT UNSIGNED   NOT NULL,"
				+"	   state		BOOLEAN			 NOT NULL," + "    primary key(no)"
				+ ") engine=InnoDB character set=utf8; ";
		String shipAddressQry = "CREATE TABLE " + id + ".ship_address("
				+ "    no           INT UNSIGNED NOT NULL AUTO_INCREMENT ," + "    ship_name   VARCHAR(30)  NOT NULL ,"
				+ "    phone_number VARCHAR(30)  NOT NULL ," + "    address      VARCHAR(50)  NOT NULL ,"
				+ "    recent       BOOLEAN      NOT NULL ," + "    member_no    INT UNSIGNED NULL,"
				+ "    primary key(no)" + ") engine=InnoDB character set=utf8; ";
		String itemReplyQry = "CREATE TABLE " + id + ".item_reply("
				+ "    no         INT UNSIGNED NOT NULL AUTO_INCREMENT,"
				+ "    parents_no INT UNSIGNED NOT NULL," + "		contents LONGBLOB NOT NULL,"
				+ "    reg_date    DATETIME          NOT NULL, "
				+ "    primary key(no)" + ") engine=InnoDB character set=utf8; ";
		HashMap<String, Object> map = new HashMap<>();
		setCreateQry(itemBoardQry, map);
		setCreateQry(itemReviewQry, map);
		setCreateQry(categoryQry, map);
		setCreateQry(stockQry, map);
		setCreateQry(optionQry, map);
		setCreateQry(memberQry, map);
		setCreateQry(replyQry, map);
		setCreateQry(orderItemQry, map);
		setCreateQry(orderQry, map);
		setCreateQry(boardQry, map);
		setCreateQry(cartQry, map);
		setCreateQry(itemQry, map);
		setCreateQry(shipAddressQry, map);
		setCreateQry(itemReplyQry, map);
	}  
	public void setCreateQry(String id, HashMap<String, Object> map) {
		if (map.containsKey("sql")) {
			map.replace("sql", id);
		} else {
			map.put("sql", id);
		}
		sqlSession.update("createTable", map);
	}
	public void alterTable(String id) {
		HashMap<String, Object> map = new HashMap<>();
		String alterItemReviewOne = "ALTER TABLE " + id + ".item_review" + " ADD CONSTRAINT FK_member_TO_item_review"
				+ " FOREIGN KEY (member_no)" + " REFERENCES " + id + ".member (no);";
		String alterItemReviewTwo = "ALTER TABLE " + id + ".item_review" + "    ADD CONSTRAINT FK_item_TO_item_review"
				+ "    FOREIGN KEY (item_no)" + "    REFERENCES " + id + ".item (no);";
		String alterItemBoard = "ALTER TABLE " + id + ".item_board" + "    ADD CONSTRAINT FK_member_TO_item_board"
				+ "        FOREIGN KEY (member_no)" + "        REFERENCES " + id + ".member(no);";
		String alterCartOne = "ALTER TABLE " + id + ".cart" + "    ADD CONSTRAINT FK_member_TO_cart"
				+ "        FOREIGN KEY (member_no)" + "        REFERENCES " + id + ".member (no);";
		String alterCartTwo = "ALTER TABLE " + id + ".cart" + "    ADD CONSTRAINT FK_stock_TO_cart"
				+ "        FOREIGN KEY (stock_no)" + "        REFERENCES " + id + ".stock (no);";
		String alterBoard = "ALTER TABLE " + id + ".board" + "    ADD CONSTRAINT FK_member_TO_board"
				+ "        FOREIGN KEY ( member_no)" + "        REFERENCES " + id + ".member (no);";
		String alterCategory = "ALTER TABLE " + id + ".category" + "    ADD CONSTRAINT FK_category_TO_category"
				+ "        FOREIGN KEY (parents_no)" + "        REFERENCES " + id + ".category (no);";
		String alterStockOne = "ALTER TABLE " + id + ".stock" + "	    ADD CONSTRAINT FK_option_TO_stock2"
				+ "	        FOREIGN KEY (first_option)" + "	        REFERENCES  " + id + ".option (no);";
		String alterStockTwo = "	ALTER TABLE " + id + ".stock" + "	    ADD CONSTRAINT FK_item_TO_stock"
				+ "	        FOREIGN KEY (item_no)" + "	        REFERENCES " + id + ".item (no);";
		String alterStockThree = "	ALTER TABLE " + id + ".stock" + "	    ADD CONSTRAINT FK_option_TO_stock"
				+ "	        FOREIGN KEY (second_option)" + "	        REFERENCES " + id + ".option (no);";
		String alterReply = "ALTER TABLE  " + id + ".reply" + "	    ADD CONSTRAINT FK_board_TO_reply"
				+ "	        FOREIGN KEY (parents_no)" + "	        REFERENCES  " + id + ".board (no);";
		String alterShipAddress = "ALTER TABLE " + id + ".ship_address"
				+ "	    ADD CONSTRAINT FK_member_TO_ship_address" + "	        FOREIGN KEY (member_no)"
				+ "	        REFERENCES  " + id + ".member (no);";
		String alterOrderItemOne = "ALTER TABLE " + id + ".order_item"
				+ "	    ADD CONSTRAINT FK_shop_order_TO_order_item" + "	        FOREIGN KEY (order_no)"
				+ "	        REFERENCES  " + id + ".shop_order (no);";
		String alterOrderItemTwo = "	ALTER TABLE " + id + ".order_item"
				+ "	    ADD CONSTRAINT FK_stock_TO_order_item" + "	        FOREIGN KEY (stock_no)"
				+ "	        REFERENCES  " + id + ".stock (no);";
		String alterShopOrderOne = "ALTER TABLE  " + id + ".shop_order" + "	    ADD CONSTRAINT FK_member_TO_shop_order"
				+ "	        FOREIGN KEY (member_no)" + "	        REFERENCES  " + id + ".member (no);";
		String alterShopOrderTwo = "ALTER TABLE  " + id + ".shop_order" + "	    ADD CONSTRAINT FK_ship_address_TO_shop_order"
				+ "	        FOREIGN KEY (ship_no)" + "	        REFERENCES  " + id + ".ship_address (no);";
		String alterItem = "ALTER TABLE  " + id + ".item" + "	    ADD CONSTRAINT FK_category_TO_item"
				+ "	        FOREIGN KEY (category_no)" + "	        REFERENCES " + id + ".category (no);";
		String alterItemReply = "	ALTER TABLE  " + id + ".item_reply"
				+ "	    ADD CONSTRAINT FK_item_board_TO_item_reply" + "	        FOREIGN KEY (parents_no)"
				+ "	        REFERENCES  " + id + ".item_board (no);";
		setAlterTable(alterShipAddress, map);
		setAlterTable(alterOrderItemOne, map);
		setAlterTable(alterOrderItemTwo, map);
		setAlterTable(alterShopOrderOne, map);
		setAlterTable(alterShopOrderTwo, map);
		setAlterTable(alterItem, map);
		setAlterTable(alterItemReply, map);
		setAlterTable(alterItemReviewOne, map);
		setAlterTable(alterItemReviewTwo, map);
		setAlterTable(alterItemBoard, map);
		setAlterTable(alterCartOne, map);
		setAlterTable(alterCartTwo, map);
		setAlterTable(alterBoard, map);
		setAlterTable(alterCategory, map);
		setAlterTable(alterStockOne, map);
		setAlterTable(alterStockTwo, map);
		setAlterTable(alterStockThree, map);
		setAlterTable(alterReply, map);
	}
	public void setAlterTable(String id, HashMap<String, Object> map) {
		if (map.containsKey("sql")) {
			map.replace("sql", id);
		} else {
			map.put("sql", id);
		}
		sqlSession.update("alterTable", map);
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
   public int insert(CeoVo ceoVo,AgreementVo agreementVo, SiteVo siteVo) {
	   sqlSession.insert("user.insert", ceoVo);
	   sqlSession.insert("user.insertSite", siteVo);
      return sqlSession.insert("user.insertAgreement", agreementVo);
      
   }

	public CeoVo findById(String id) {
		return sqlSession.selectOne("user.findById", id);
	}
	
	public CeoVo findByIdAndPassword(CeoVo ceoVo) {
		return sqlSession.selectOne("user.findByIdAndPassword", ceoVo);
	}

	public CeoVo findByIdJoin(String id) {
		return sqlSession.selectOne("user.findByIdJoin", id);
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	public String getSession() {
		ServletRequestAttributes attr 
			= (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		
		HttpSession nowSession = attr.getRequest().getSession();
		
		String id =nowSession.getAttribute("name").toString();
		
		
		return id;
	}
	
	public String findIdByNameAndPhone(String name, String phoneNum) {
		Map<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("phoneNum", phoneNum);
		
		return sqlSession.selectOne("user.findIdByNameAndPhone", map);
	}
	public int updatePassword(String id, String password) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		
		return sqlSession.update("user.updatePassword", map);
	}
	
	public int getTotalRevenue(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		return sqlSession.selectOne("user.getTotalRevenue", map);
	}
	public int getSales(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		return sqlSession.selectOne("user.getSales", map);
	}
	
	public void insertSubMenu(String id) {
		sqlSession.insert("user.insertMainPageMenu", id);
		sqlSession.insert("user.insertFAQMenu", id);
	}
	public int getStatementOrderCompleted(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		return sqlSession.selectOne("user.getStatementOrderCompleted", map);
	}
	public int getStatementDepositcompleted(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		return sqlSession.selectOne("user.getStatementDepositcompleted", map);
	}
	public int getStatementPreparingDelivery(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		return sqlSession.selectOne("user.getStatementPreparingDelivery", map);
	}
	public int getStatementShippingProgress(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		return sqlSession.selectOne("user.getStatementShippingProgress", map);
	}
	public int getStatementDeliveryCompleted(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		return sqlSession.selectOne("user.getStatementDeliveryCompleted", map);
	}
	public int getStatementCancelProcessing(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		return sqlSession.selectOne("user.getStatementCancelProcessing", map);
	}
	public int getStatementExchangeProcessing(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		return sqlSession.selectOne("user.getStatementExchangeProcessing", map);
	}
	public int getStatementRefundProcessing(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		return sqlSession.selectOne("user.getStatementRefundProcessing", map);
	}
	public int getStatementProcessingCompleted(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		return sqlSession.selectOne("user.getStatementProcessingCompleted", map);
	}
	public int insertShop(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		return sqlSession.insert("user.insertShop", map);
	}


}
