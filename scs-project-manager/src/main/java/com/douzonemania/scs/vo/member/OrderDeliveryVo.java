package com.douzonemania.scs.vo.member;

import java.sql.Timestamp;

public class OrderDeliveryVo {

	private int no;
	private String name;

	private Timestamp regDate;
	private String orderNumber;
	private String id;
	private String status;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "OrderDeliveryVo [no=" + no + ", name=" + name + ", regDate=" + regDate + ", orderNumber=" + orderNumber
				+ ", id=" + id + ", status=" + status + ", dataValue=" + dataValue + "]";
	}

}
