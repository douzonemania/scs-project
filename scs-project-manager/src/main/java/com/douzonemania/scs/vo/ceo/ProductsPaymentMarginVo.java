package com.douzonemania.scs.vo.ceo;

public class ProductsPaymentMarginVo {

	private int totalMargin;
	private String date;

	public int getTotalMargin() {
		return totalMargin;
	}

	public void setTotalMargin(int totalMargin) {
		this.totalMargin = totalMargin;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "ProductsPaymentMarginVo [totalMargin=" + totalMargin + ", date=" + date + "]";
	}

}
