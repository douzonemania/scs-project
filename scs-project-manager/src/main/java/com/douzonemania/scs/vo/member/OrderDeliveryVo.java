package com.douzonemania.scs.vo.member;

import java.sql.Timestamp;

public class OrderDeliveryVo {

	private int no;
	private String name;

	private Timestamp regDate;
	private String orderNumber;
	private String id;
	private String statement;
	public String getStatement() {
		return statement;
	}

	public void setStatement(String statement) {
		this.statement = statement;
	}

	private int dataValue;

	public int getDataValue() {
		return dataValue;
	}

	public void setDataValue(int dataValue) {
		this.dataValue = dataValue;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "OrderDeliveryVo [no=" + no + ", name=" + name + ", regDate=" + regDate + ", orderNumber=" + orderNumber
				+ ", id=" + id + ", statement=" + statement + ", dataValue=" + dataValue + "]";
	}

}
