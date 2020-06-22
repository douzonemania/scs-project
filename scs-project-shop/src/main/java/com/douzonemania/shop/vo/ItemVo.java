package com.douzonemania.shop.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class ItemVo {

	private int no;
	private String code;
	private String name;
	private int supPrice;
	private int nowPrice;
	private int sale; // 할인율 (% 단위)
	private String mainImage;
	private String subImage; // 부가이미지 (,로 구분지어 들어감)
	private boolean visible = true;
	private boolean bestItem = false;
	private boolean newItem = false;
	private String editor;
	private String des;
	private Date regDate;
	private String categoryNo;
	private int intRevAvg;
	private double douRevAvg;
	private int cnt;
	private double rate;
	private int totalPrice;
	private int stock;
	private int amount;
	private int cartNo;
	private int firstOption;
	private int secondOption;
	private String firstOptionName;
	private String secondOptionName;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSupPrice() {
		return supPrice;
	}
	public void setSupPrice(int supPrice) {
		this.supPrice = supPrice;
	}
	public int getNowPrice() {
		return nowPrice;
	}
	public void setNowPrice(int nowPrice) {
		this.nowPrice = nowPrice;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public String getMainImage() {
		return mainImage;
	}
	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}
	public String getSubImage() {
		return subImage;
	}
	public void setSubImage(String subImage) {
		this.subImage = subImage;
	}
	public boolean isVisible() {
		return visible;
	}
	public void setVisible(boolean visible) {
		this.visible = visible;
	}
	public boolean isBestItem() {
		return bestItem;
	}
	public void setBestItem(boolean bestItem) {
		this.bestItem = bestItem;
	}
	public boolean isNewItem() {
		return newItem;
	}
	public void setNewItem(boolean newItem) {
		this.newItem = newItem;
	}
	public String getEditor() {
		return editor;
	}
	public void setEditor(String editor) {
		this.editor = editor;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}
	public int getIntRevAvg() {
		return intRevAvg;
	}
	public void setIntRevAvg(int intRevAvg) {
		this.intRevAvg = intRevAvg;
	}
	public double getDouRevAvg() {
		return douRevAvg;
	}
	public void setDouRevAvg(double douRevAvg) {
		this.douRevAvg = douRevAvg;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public int getFirstOption() {
		return firstOption;
	}
	public void setFirstOption(int firstOption) {
		this.firstOption = firstOption;
	}
	public int getSecondOption() {
		return secondOption;
	}
	public void setSecondOption(int secondOption) {
		this.secondOption = secondOption;
	}
	public String getFirstOptionName() {
		return firstOptionName;
	}
	public void setFirstOptionName(String firstOptionName) {
		this.firstOptionName = firstOptionName;
	}
	public String getSecondOptionName() {
		return secondOptionName;
	}
	public void setSecondOptionName(String secondOptionName) {
		this.secondOptionName = secondOptionName;
	}
	@Override
	public String toString() {
		return "ItemVo [no=" + no + ", code=" + code + ", name=" + name + ", supPrice=" + supPrice + ", nowPrice="
				+ nowPrice + ", sale=" + sale + ", mainImage=" + mainImage + ", subImage=" + subImage + ", visible="
				+ visible + ", bestItem=" + bestItem + ", newItem=" + newItem + ", editor=" + editor + ", des=" + des
				+ ", regDate=" + regDate + ", categoryNo=" + categoryNo + ", intRevAvg=" + intRevAvg + ", douRevAvg="
				+ douRevAvg + ", cnt=" + cnt + ", rate=" + rate + ", totalPrice=" + totalPrice + ", stock=" + stock
				+ ", amount=" + amount + ", cartNo=" + cartNo + ", firstOption=" + firstOption + ", secondOption="
				+ secondOption + ", firstOptionName=" + firstOptionName + ", secondOptionName=" + secondOptionName
				+ "]";
	}
	

	
	
	
	

	
	
}
