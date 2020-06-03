package com.douzonemania.scs.vo.member;

import java.sql.Timestamp;

public class OrderSettleVo {

	private int no;
	private String id;
	private Timestamp regDate;
	private String orderNumber;
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	private int purchasePrice;
	private int marginPrice;
	
	private int totalPrice;
	private int totalMargin;
	
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getTotalMargin() {
		return totalMargin;
	}
	public void setTotalMargin(int totalMargin) {
		this.totalMargin = totalMargin;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getPurchasePrice() {
		return purchasePrice;
	}
	public void setPurchasePrice(int purchasePrice) {
		this.purchasePrice = purchasePrice;
	}
	public int getMarginPrice() {
		return marginPrice;
	}
	public void setMarginPrice(int marginPrice) {
		this.marginPrice = marginPrice;
	}
	@Override
	public String toString() {
		return "OrderSettleVo [no=" + no + ", id=" + id + ", regDate=" + regDate + ", orderNumber=" + orderNumber
				+ ", purchasePrice=" + purchasePrice + ", marginPrice=" + marginPrice + ", totalPrice=" + totalPrice
				+ ", totalMargin=" + totalMargin + "]";
	}
	
	
}
