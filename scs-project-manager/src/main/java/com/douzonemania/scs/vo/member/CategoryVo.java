package com.douzonemania.scs.vo.member;

public class CategoryVo {

	private int no;
	private String name;
	private int parentNo;

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

	public int getParentNo() {
		return parentNo;
	}

	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}

	@Override
	public String toString() {
		return "CategoryVo [no=" + no + ", name=" + name + ", parentNo=" + parentNo + "]";
	}

}
