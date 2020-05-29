package com.douzonemania.scs.vo.member;

import java.sql.Timestamp;

public class ItemBoardVo {

	private int no;
	private String title;
	private String contents;
	private Timestamp regDate;
	private int memberNo;
	private int itemNo;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	@Override
	public String toString() {
		return "ItemBoardVo [no=" + no + ", title=" + title + ", contents=" + contents + ", regDate=" + regDate
				+ ", memberNo=" + memberNo + ", itemNo=" + itemNo + "]";
	}

}
