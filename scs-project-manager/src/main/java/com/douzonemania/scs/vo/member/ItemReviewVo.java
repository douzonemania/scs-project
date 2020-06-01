package com.douzonemania.scs.vo.member;

import java.sql.Timestamp;

public class ItemReviewVo {
	private int no;
	private int rate;
	private String title;
	private String contents;
	private String image;
	private int itemNo;
	private int memberNo;
	private Timestamp regDate;

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

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "ItemReviewVo [no=" + no + ", rate=" + rate + ", title=" + title + ", contents=" + contents + ", image="
				+ image + ", itemNo=" + itemNo + ", memberNo=" + memberNo + ", regDate=" + regDate + "]";
	}

}
