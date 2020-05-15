package com.douzonemania.scs.vo.member;

public class CartVo {
	private int no;
	private int amount;
	private int memberNo;
	private int stockNo;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getStockNo() {
		return stockNo;
	}

	public void setStockNo(int stockNo) {
		this.stockNo = stockNo;
	}

	@Override
	public String toString() {
		return "CartVo [no=" + no + ", amount=" + amount + ", memberNo=" + memberNo + ", stockNo=" + stockNo + "]";
	}

}
