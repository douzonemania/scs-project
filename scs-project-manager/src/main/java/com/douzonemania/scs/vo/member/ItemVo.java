package com.douzonemania.scs.vo.member;

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
	private Timestamp regDate;



	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

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

	@Override
	public String toString() {
		return "ItemVo [no=" + no + ", code=" + code + ", name=" + name + ", supPrice=" + supPrice + ", nowPrice="
				+ nowPrice + ", sale=" + sale + ", mainImage=" + mainImage + ", subImage=" + subImage + ", visible="
				+ visible + ", bestItem=" + bestItem + ", newItem=" + newItem + ", editor=" + editor + ", des=" + des
				+ ", regDate=" + regDate + "]";
	}

}
