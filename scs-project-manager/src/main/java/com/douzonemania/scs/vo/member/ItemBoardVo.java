package com.douzonemania.scs.vo.member;

public class ItemBoardVo {

	private int no;
	private String title;
	private String contents;
	private int memberNo;
	private int itemNo;
	private int replyNo;

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

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	@Override
	public String toString() {
		return "ItemBoardVo [no=" + no + ", title=" + title + ", contents=" + contents + ", memberNo=" + memberNo
				+ ", itemNo=" + itemNo + ", replyNo=" + replyNo + "]";
	}

}
