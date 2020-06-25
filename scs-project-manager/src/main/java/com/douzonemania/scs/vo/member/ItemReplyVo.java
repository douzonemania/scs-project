package com.douzonemania.scs.vo.member;

import java.sql.Timestamp;
import java.util.Arrays;

public class ItemReplyVo {
	private int no;
	private int parentsNo;
	private byte[] contents;
	private String contents1;

	public void setContents(byte[] contents) {
		this.contents = contents;
	}

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

	public byte[] getContents() {
		return contents;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public String getContents1() {
		return contents1;
	}

	public void setContents1(String contents1) {
		this.contents1 = contents1;
	}

	@Override
	public String toString() {
		return "ItemReplyVo [no=" + no + ", parentsNo=" + parentsNo + ", contents=" + Arrays.toString(contents)
				+ ", contents1=" + contents1 + ", regDate=" + regDate + "]";
	}

}
