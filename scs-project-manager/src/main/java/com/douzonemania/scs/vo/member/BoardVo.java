package com.douzonemania.scs.vo.member;

import java.sql.Timestamp;
import java.util.Arrays;

public class BoardVo {

	private int no;

	private String category;
	private String title;

	private byte[] contents;
	private String contents1;

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

	public byte[] getContents() {
		return contents;
	}

	public void setContents(byte[] contents) {
		this.contents = contents;
	}

	public String getContents1() {
		return contents1;
	}

	public void setContents1(String contents1) {
		this.contents1 = contents1;
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

	public boolean isReplyState() {
		return replyState;
	}

	public void setReplyState(boolean replyState) {
		this.replyState = replyState;
	}

	@Override
	public String toString() {
		return "BoardVo [no=" + no + ", category=" + category + ", title=" + title + ", contents="
				+ Arrays.toString(contents) + ", contents1=" + contents1 + ", memberNo=" + memberNo + ", regDate="
				+ regDate + ", id=" + id + ", name=" + name + ", replyState=" + replyState + "]";
	}

}
