package com.douzonemania.scs.vo.ceo;

public class CategoryBarVo {

	
	private int categoryNo;
	private String categoryName;
	private int totalPrice;
	private String date;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
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
		return "CategoryBarVo [date=" + date + ", totalPrice=" + totalPrice + ", categoryNo=" + categoryNo
				+ ", categoryName=" + categoryName + "]";
	}

}
