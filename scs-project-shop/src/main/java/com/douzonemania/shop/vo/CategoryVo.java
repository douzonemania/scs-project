package com.douzonemania.shop.vo;

public class CategoryVo {
	
	int no;
	String name;
	int parentsNo;
	
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
	public int getParentsNo() {
		return parentsNo;
	}
	public void setParentsNo(int parentsNo) {
		this.parentsNo = parentsNo;
	}
	@Override
	public String toString() {
		return "CategoryVo [no=" + no + ", name=" + name + ", parentsNo=" + parentsNo + "]";
	}
}
