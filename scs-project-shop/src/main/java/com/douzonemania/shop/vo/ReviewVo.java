package com.douzonemania.shop.vo;

public class ReviewVo {

	private int no;
	private int rate;
	private String title;
	private String content;
	private String image;
	private int itemNo;
	private int memberNo;
	private int stockNo;
	private String orderNo;
	private String regDate;
	private String size;
	private String color;
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public int getStockNo() {
		return stockNo;
	}
	public void setStockNo(int stockNo) {
		this.stockNo = stockNo;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "ReviewVo [no=" + no + ", rate=" + rate + ", title=" + title + ", content=" + content + ", image="
				+ image + ", itemNo=" + itemNo + ", memberNo=" + memberNo + ", stockNo=" + stockNo + ", orderNo="
				+ orderNo + ", regDate=" + regDate + ", size=" + size + ", color=" + color + "]";
	}
	
}
