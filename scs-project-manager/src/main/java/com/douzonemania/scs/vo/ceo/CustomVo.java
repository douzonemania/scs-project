package com.douzonemania.scs.vo.ceo;

public class CustomVo {
	private int no;
	private int index;
	private String designId;
	private int menuNo;

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

	public String getDesignId() {
		return designId;
	}

	public void setDesignId(String designId) {
		this.designId = designId;
	}

	public int getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}

	@Override
	public String toString() {
		return "CustomVo [no=" + no + ", index=" + index + ", designId=" + designId + ", menuNo=" + menuNo + "]";
	}

}
