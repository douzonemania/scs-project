package com.douzonemania.shop.vo;

import java.sql.Timestamp;

public class ReplyVo {
	private int no;
	private int parentsNo;
	private String contents;
	private Timestamp regDate;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getParentsNo() {
		return parentsNo;
	}

	public void setParentsNo(int parentsNo) {
		this.parentsNo = parentsNo;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "ReplyVo [no=" + no + ", parentsNo=" + parentsNo + ", contents=" + contents + ", regDate=" + regDate
				+ "]";
	}

}
