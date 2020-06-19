package com.douzonemania.scs.vo.ceo;

public class ProductsPaymentAmountVo {

	private int totalPrice;
	private String date;
	private int count;
	private int resultPrice;


	
	public int getResultPrice() {
		return resultPrice;
	}

	public void setResultPrice(int resultPrice) {
		this.resultPrice = resultPrice;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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

	@Override
	public String toString() {
		return "ProductsPaymentAmountVo [totalPrice=" + totalPrice + ", date=" + date + ", count=" + count
				+ ", resultPrice=" + resultPrice + "]";
	}

}
