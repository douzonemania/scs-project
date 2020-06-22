package com.douzonemania.scs.vo.member;

import java.sql.Timestamp;

public class ItemReplyVo {
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
		return "ItemReplyVo [no=" + no + ", parentsNo=" + parentsNo + ", contents=" + contents + ", reg_date="
				+ regDate + "]";
	}

}
