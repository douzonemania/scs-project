package com.douzonemania.shop.vo;

public class StockVo {

	int no;
	int itemNo;
	int firstOption;
	int secondOption;
	int stock;
	String firstOptionName;
	String secondOptionName;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getItem_no() {
		return itemNo;
	}
	public void setItem_no(int itemNo) {
		this.itemNo = itemNo;
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
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
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
		return "StockVo [no=" + no + ", item_no=" + itemNo + ", firstOption=" + firstOption + ", secondOption="
				+ secondOption + ", stock=" + stock + ", firstOptionName=" + firstOptionName + ", secondOptionName="
				+ secondOptionName + "]";
	}
	
	
	
}
