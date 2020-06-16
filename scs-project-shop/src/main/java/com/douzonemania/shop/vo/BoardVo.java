package com.douzonemania.shop.vo;

import java.sql.Timestamp;

public class BoardVo {

	private int no;
	private String category;
	private String title;
	private String contents;
	private int memberNo;
	private Timestamp regDate;
	private boolean state;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "BoardVo [no=" + no + ", category=" + category + ", title=" + title + ", contents=" + contents
				+ ", memberNo=" + memberNo + ", regDate=" + regDate + ", state=" + state + "]";
	}

}
