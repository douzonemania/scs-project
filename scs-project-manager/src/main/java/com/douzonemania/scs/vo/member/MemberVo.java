package com.douzonemania.scs.vo.member;

import java.sql.Timestamp;

public class MemberVo {

	private int no;
	private String id;
	private String password;
	private String phoneNumber;
	private String email;
	private Timestamp regDate;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "MemberVo [no=" + no + ", id=" + id + ", password=" + password + ", phoneNumber=" + phoneNumber
				+ ", email=" + email + ", regDate=" + regDate + "]";
	}

}
