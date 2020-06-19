package com.douzonemania.scs.vo.ceo;

public class ProductsSalesVo {

	private int TotalSales;
	private String date;

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "ProductsSalesVo [TotalSales=" + TotalSales + ", date=" + date + "]";
	}

	public int getTotalSales() {
		return TotalSales;
	}

	public void setTotalSales(int totalSales) {
		TotalSales = totalSales;
	}

	public String getDate() {
		return date;
	}

}
