package com.douzonemania.scs.vo.member;

import java.sql.Timestamp;
import java.util.Arrays;

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

	private byte[] editor;
	private String editor1;

	private String description;
	private Timestamp regDate;
	private int categoryNo;
	private String shipCompany;
	private int shipCharge;
	private boolean state;

	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public String getShipCompany() {
		return shipCompany;
	}

	public void setShipCompany(String shipCompany) {
		this.shipCompany = shipCompany;
	}

	public int getShipCharge() {
		return shipCharge;
	}

	public void setShipCharge(int shipCharge) {
		this.shipCharge = shipCharge;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
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

	public byte[] getEditor() {
		return editor;
	}

	public void setEditor(byte[] editor) {
		this.editor = editor;
	}

	public String getEditor1() {
		return editor1;
	}

	public void setEditor1(String editor1) {
		this.editor1 = editor1;
	}

	@Override
	public String toString() {
		return "ItemVo [no=" + no + ", code=" + code + ", name=" + name + ", supPrice=" + supPrice + ", nowPrice="
				+ nowPrice + ", sale=" + sale + ", mainImage=" + mainImage + ", subImage=" + subImage + ", visible="
				+ visible + ", bestItem=" + bestItem + ", newItem=" + newItem + ", editor=" + Arrays.toString(editor)
				+ ", editor1=" + editor1 + ", description=" + description + ", regDate=" + regDate + ", categoryNo="
				+ categoryNo + ", shipCompany=" + shipCompany + ", shipCharge=" + shipCharge + ", state=" + state + "]";
	}

}
