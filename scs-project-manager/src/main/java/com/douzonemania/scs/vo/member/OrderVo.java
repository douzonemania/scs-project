package com.douzonemania.scs.vo.member;

import java.sql.Timestamp;

public class OrderVo {
	private int no;
	private String orderNumber;
	private Timestamp regDate;
	private String statement;
	private int memberNo;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public String getStatement() {
		return statement;
	}

	public void setStatement(String statement) {
		this.statement = statement;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "OrderVo [no=" + no + ", orderNumber=" + orderNumber + ", regDate=" + regDate + ", statement="
				+ statement + ", memberNo=" + memberNo + "]";
	}

}
