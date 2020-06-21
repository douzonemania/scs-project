package com.douzonemania.shop.vo;

public class ReviewVo {

	private int no;
	private int rate;
	private String title;
	private String contents;
	private String image;
	private int itemNo;
	private int memberNo;
	private String regDate;
	private String size;
	private String color;
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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
		return "ReviewVo [no=" + no + ", rate=" + rate + ", title=" + title + ", contents=" + contents + ", image="
				+ image + ", itemNo=" + itemNo + ", memberNo=" + memberNo + ", regDate=" + regDate + ", size=" + size
				+ ", color=" + color + "]";
	}
	
}
