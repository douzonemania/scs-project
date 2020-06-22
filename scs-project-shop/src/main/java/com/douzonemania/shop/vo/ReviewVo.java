package com.douzonemania.shop.vo;
public class ReviewVo {
	private int no;
	private int rate;
	private String title;
	private String content;
	private String image;
	private int itemNo;
	private int memberNo;
	private String regDate;
	private String size;
	private String color;
	private String id;
	private String itemName;
	private String mainImage;
	private int stockNo;
	private String orderNo;
	
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
	public void setContent(String contents) {
		this.content = contents;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getMainImage() {
		return mainImage;
	}
	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}
	public int getStockNo() {
		return stockNo;
	}
	public void setStockNo(int stockNo) {
		this.stockNo = stockNo;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	@Override
	public String toString() {
		return "ReviewVo [no=" + no + ", rate=" + rate + ", title=" + title + ", content=" + content + ", image="
				+ image + ", itemNo=" + itemNo + ", memberNo=" + memberNo + ", regDate=" + regDate + ", size=" + size
				+ ", color=" + color + ", id=" + id + ", itemName=" + itemName + ", mainImage=" + mainImage
				+ ", stockNo=" + stockNo + ", orderNo=" + orderNo + "]";
	}
}
