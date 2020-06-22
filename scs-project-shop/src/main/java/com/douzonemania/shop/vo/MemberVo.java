package com.douzonemania.shop.vo;

public class MemberVo {
	private Long no;
	private String id;
	private String password;
	private String phoneNumber;
	private String email;
	private String regDate;
	private String type;
	private String name;
	
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name=name;
	}
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "MemberVo [no=" + no + ", id=" + id + ", password=" + password + ", phoneNumber=" + phoneNumber
				+ ", email=" + email + ", regDate=" + regDate + ", type=" + type +",name = "+name+"]";
	}

	

}
