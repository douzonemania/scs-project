package com.douzonemania.scs.vo.ceo;

public class SubMenuVo {
	private int no;
	private int index;
	private String name;
	private String id;

	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "SubMenuVo [no=" + no + ", index=" + index + ", name=" + name + ", id=" + id + "]";
	}
	
	

}
