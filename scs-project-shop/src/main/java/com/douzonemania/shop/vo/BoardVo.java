package com.douzonemania.shop.vo;

import java.sql.Timestamp;

public class BoardVo {

	private int no;
	private String category;
	private String title;
	private String contents;
	private int memberNo;
	private Timestamp regDate;
	private String id; // member id
	private String name; // member name
	private boolean replyState; // 답글 여부

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

	public boolean isReplyState() {
		return replyState;
	}

	public void setReplyState(boolean replyState) {
		this.replyState = replyState;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "BoardVo [no=" + no + ", category=" + category + ", title=" + title + ", contents=" + contents
				+ ", memberNo=" + memberNo + ", regDate=" + regDate + ", replyState=" + replyState + ", id=" + id
				+ ", name=" + name + "]";
	}

}
