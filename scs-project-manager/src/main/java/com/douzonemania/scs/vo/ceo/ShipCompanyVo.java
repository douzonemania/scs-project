package com.douzonemania.scs.vo.ceo;

public class ShipCompanyVo {
	private int no;
	private String name;
	private String id;

	
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "ShipCompanyVo [no=" + no + ", name=" + name + ", id=" + id + "]";
	}
	
	
}


