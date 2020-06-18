package com.douzonemania.shop.vo;

import java.sql.Timestamp;

public class ItemBoardVo {

	private int no;
	private String title;
	private String contents;
	private Timestamp regDate;
	private int memberNo;
	private int itemNo;
	private boolean replyState;
	private String code; // 상품 코드
	private String id; // 회원 아이디
	private String name; // 회원 이름
	private String mainImage;	// 상품 이미지
	private String itemName;	// 상품 이름

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

	public String getMainImage() {
		return mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	@Override
	public String toString() {
		return "ItemBoardVo [no=" + no + ", title=" + title + ", contents=" + contents + ", regDate=" + regDate
				+ ", memberNo=" + memberNo + ", itemNo=" + itemNo + ", replyState=" + replyState + ", code=" + code
				+ ", id=" + id + ", name=" + name + ", mainImage=" + mainImage + ", itemName=" + itemName + "]";
	}

}
