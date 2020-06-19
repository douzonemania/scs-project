package com.douzonemania.scs.vo.ceo;

public class CategoryDonutVo {

	private int count;
	private int categoryNo;
	private String categoryName;

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	
	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "CategoryDonutVo [count=" + count + ", categoryNo=" + categoryNo + ", categoryName=" + categoryName
				+ "]";
	}

}
