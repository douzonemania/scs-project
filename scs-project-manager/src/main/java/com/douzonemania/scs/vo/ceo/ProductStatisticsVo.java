package com.douzonemania.scs.vo.ceo;

public class ProductStatisticsVo {
	private String date;
	private int count;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "ProductStatisticsVo [date=" + date + ", count=" + count + "]";
	}

}
