package com.douzonemania.scs.vo.member;

public class OrderItemVo {
	private int orderNo;
	private int stockNo;

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getStockNo() {
		return stockNo;
	}

	public void setStockNo(int stockNo) {
		this.stockNo = stockNo;
	}

	@Override
	public String toString() {
		return "OrderItemVo [orderNo=" + orderNo + ", stockNo=" + stockNo + "]";
	}

}
