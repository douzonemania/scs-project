package com.douzonemania.scs.vo.member;

public class OptionVo {

	private int no;
	private String name;

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

	@Override
	public String toString() {
		return "OptionVo [no=" + no + ", name=" + name + "]";
	}

}
