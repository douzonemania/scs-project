package com.douzonemania.shop.vo;

import java.sql.Timestamp;
import java.util.Arrays;

public class ReplyVo {
	private int no;
	private int parentsNo;
	private Timestamp regDate;
	private byte[] contents;
	private String contents1;

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

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
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

	@Override
	public String toString() {
		return "ReplyVo [no=" + no + ", parentsNo=" + parentsNo + ", regDate=" + regDate + ", contents="
				+ Arrays.toString(contents) + ", contents1=" + contents1 + "]";
	}

}
