package com.douzonemania.scs.vo.ceo;

public class CategoryLineSalesVo {
	private int totalPrice;
	private String date;

	@Override
	public String toString() {
		return "CategoryLineSalesVo [totalPrice=" + totalPrice + ", date=" + date + "]";
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
