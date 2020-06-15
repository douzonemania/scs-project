package com.douzonemania.shop.vo;

public class SubMenuVo {
	private int no;
	private int menuIndex;
	private String name;
	private String id;
	private Boolean state;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getMenuIndex() {
		return menuIndex;
	}

	public void setMenuIndex(int menuIndex) {
		this.menuIndex = menuIndex;
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

	public Boolean getState() {
		return state;
	}

	public void setState(Boolean state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "SubMenuVo [no=" + no + ", menuIndex=" + menuIndex + ", name=" + name + ", id=" + id + ", state=" + state
				+ "]";
	}

}
