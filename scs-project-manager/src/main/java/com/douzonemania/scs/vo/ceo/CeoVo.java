package com.douzonemania.scs.vo.ceo;

import java.sql.Timestamp;

public class CeoVo {
	private String id;
	private String name;
	private String password;
	private String phoneNumber;
	private String email;
	private String companyName;
	private Timestamp regDate;
	private String faxNumber;
	private String cpNumber;
	private String address;
	private String siteName;
	private String coNumber;
	private String cmNumber;

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

	public String getFaxNumber() {
		return faxNumber;
	}

	public void setFaxNumber(String faxNumber) {
		this.faxNumber = faxNumber;
	}

	public String getCpNumber() {
		return cpNumber;
	}

	public void setCpNumber(String cpNumber) {
		this.cpNumber = cpNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	public String getCoNumber() {
		return coNumber;
	}

	public void setCoNumber(String coNumber) {
		this.coNumber = coNumber;
	}

	public String getCmNumber() {
		return cmNumber;
	}

	public void setCmNumber(String cmNumber) {
		this.cmNumber = cmNumber;
	}

	@Override
	public String toString() {
		return "CeoVo [id=" + id + ", name=" + name + ", password=" + password + ", phoneNumber=" + phoneNumber
				+ ", email=" + email + ", companyName=" + companyName + ", regDate=" + regDate + ", faxNumber="
				+ faxNumber + ", cpNumber=" + cpNumber + ", address=" + address + ", siteName=" + siteName
				+ ", coNumber=" + coNumber + ", cmNumber=" + cmNumber + "]";
	}

}
