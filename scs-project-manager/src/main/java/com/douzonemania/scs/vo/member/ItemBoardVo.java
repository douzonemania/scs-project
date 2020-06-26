package com.douzonemania.scs.vo.member;

import java.sql.Timestamp;
import java.util.Arrays;

public class ItemBoardVo {

	private int no;
	private String title;

	private byte[] contents;
	private String contents1;

	private Timestamp regDate;
	private int memberNo;
	private int itemNo;
	private boolean replyState;
	private String code; // 상품 코드
	private String id; // 회원 아이디
	private String name; // 회원 이름

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

	public boolean isReplyState() {
		return replyState;
	}

	public void setReplyState(boolean replyState) {
		this.replyState = replyState;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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
		return "ItemBoardVo [no=" + no + ", title=" + title + ", contents=" + Arrays.toString(contents) + ", contents1="
				+ contents1 + ", regDate=" + regDate + ", memberNo=" + memberNo + ", itemNo=" + itemNo + ", replyState="
				+ replyState + ", code=" + code + ", id=" + id + ", name=" + name + "]";
	}

}
