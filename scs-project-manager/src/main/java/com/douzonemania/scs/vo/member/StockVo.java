package com.douzonemania.scs.vo.member;

public class StockVo {

	private int no;
	private int itemNo;
	private int firstOption;
	private int secondOption;
	private int stock; // 재고량

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public int getFirstOption() {
		return firstOption;
	}

	public void setFirstOption(int firstOption) {
		this.firstOption = firstOption;
	}

	public int getSecondOption() {
		return secondOption;
	}

	public void setSecondOption(int secondOption) {
		this.secondOption = secondOption;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	@Override
	public String toString() {
		return "StockVo [no=" + no + ", itemNo=" + itemNo + ", firstOption=" + firstOption + ", secondOption="
				+ secondOption + ", stock=" + stock + "]";
	}

}
