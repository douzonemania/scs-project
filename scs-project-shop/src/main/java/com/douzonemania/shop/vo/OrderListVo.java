package com.douzonemania.shop.vo;

public class OrderListVo {
	int no;
	String name;
	String image;
	String color;
	String size;
	String regDate;
	String orderNo;
	String stockNo;
	Boolean reState;
	int amount;
	int totalPrice;
	int orderNoPrime;
	
	
	public int getOrderNoPrime() {
		return orderNoPrime;
	}
	public void setOrderNoPrime(int orderNoPrime) {
		this.orderNoPrime = orderNoPrime;
	}
	String statement;
	
	
	public String getStockNo() {
		return stockNo;
	}
	public void setStockNo(String stockNo) {
		this.stockNo = stockNo;
	}
	public Boolean getReState() {
		return reState;
	}
	public void setReState(Boolean reState) {
		this.reState = reState;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getStatement() {
		return statement;
	}
	public void setStatement(String statement) {
		this.statement = statement;
	}
	@Override
	public String toString() {
		return "OrderListVo [no=" + no + ", name=" + name + ", image=" + image + ", color=" + color + ", size=" + size
				+ ", regDate=" + regDate + ", orderNo=" + orderNo + ", stockNo=" + stockNo + ", reState=" + reState
				+ ", amount=" + amount + ", totalPrice=" + totalPrice + ", orderNoPrime=" + orderNoPrime
				+ ", statement=" + statement + "]";
	}
}
