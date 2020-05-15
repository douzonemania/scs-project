package com.douzonemania.scs.vo.ceo;

import java.sql.Timestamp;

public class CeoVo {
	private String id;
	private String password;
	private String phoneNumber;
	private String email;
	private String companyName;
	private Timestamp regDate;
	
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
	
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	public Timestamp getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "CeoVo [id=" + id + ", password=" + password + ", phoneNumber=" + phoneNumber + ", email=" + email
				+ ", companyName=" + companyName + ", regDate=" + regDate + "]";
	}
	
	

	
}
