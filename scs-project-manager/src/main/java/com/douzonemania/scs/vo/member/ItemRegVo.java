package com.douzonemania.scs.vo.member;

import java.sql.Timestamp;

public class ItemRegVo {
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
	private Timestamp regDate;
	private String categoryName1;
	private String categoryName2;
	private String shipCompany;
	private int shippingCharge;
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
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getCategoryName1() {
		return categoryName1;
	}
	public void setCategoryName1(String categoryName1) {
		this.categoryName1 = categoryName1;
	}
	public String getCategoryName2() {
		return categoryName2;
	}
	public void setCategoryName2(String categoryName2) {
		this.categoryName2 = categoryName2;
	}
	public String getShipCompany() {
		return shipCompany;
	}
	public void setShipCompany(String shipCompany) {
		this.shipCompany = shipCompany;
	}
	public int getShippingCharge() {
		return shippingCharge;
	}
	public void setShippingCharge(int shippingCharge) {
		this.shippingCharge = shippingCharge;
	}
	@Override
	public String toString() {
		return "ItemRegVo [no=" + no + ", code=" + code + ", name=" + name + ", supPrice=" + supPrice + ", nowPrice="
				+ nowPrice + ", sale=" + sale + ", mainImage=" + mainImage + ", subImage=" + subImage + ", visible="
				+ visible + ", bestItem=" + bestItem + ", newItem=" + newItem + ", editor=" + editor + ", des=" + des
				+ ", regDate=" + regDate + ", categoryName1=" + categoryName1 + ", categoryName2=" + categoryName2
				+ ", shipCompany=" + shipCompany + ", shippingCharge=" + shippingCharge + "]";
	}
	
	
}
