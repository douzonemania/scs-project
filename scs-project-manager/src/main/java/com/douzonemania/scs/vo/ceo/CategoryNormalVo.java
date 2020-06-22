package com.douzonemania.scs.vo.ceo;

public class CategoryNormalVo {

	private int count;
	private String date;

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "CategoryNormalVo [count=" + count + ", date=" + date + "]";
	}
}
