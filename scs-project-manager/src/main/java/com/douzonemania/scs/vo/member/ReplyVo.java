package com.douzonemania.scs.vo.member;

public class ReplyVo {
	private int no;
	private int parentsNo;

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

	@Override
	public String toString() {
		return "ReplyVo [no=" + no + ", parentsNo=" + parentsNo + "]";
	}

}
