package com.douzonemania.shop.vo;

public class OptionVo {

	int no;
	String name;
	String type;
	int stock;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	@Override
	public String toString() {
		return "OptionVo [no=" + no + ", name=" + name + ", type=" + type + ", stock=" + stock + "]";
	}
	
	
	
	
	
	
}
