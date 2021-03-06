package com.douzonemania.shop.vo;

import java.sql.Timestamp;

public class CeoVo {

//	@NotEmpty
//	@Length(min = 4, max = 10)
	private String id;

	private String name;

//	@Length(min = 4, max = 12)
	private String password;

	private String phoneNumber;
	private String email;
	private String companyName;

	private Timestamp regDate;
	private String faxNumber;
	private String cpNumber;
	private String address1;
	private String address2;
	private String postcode;
	private String address;
	private String siteName;
	private String coNumber;		// 사업자등록번호
	private String cmNumber;		// 통신판매신고번호
	private Integer shipCharge;
	private String logo;
	private String favicon;
	private String sourceLogo;
	private String sourceFavicon;

	public String getSourceLogo() {
		return sourceLogo;
	}

	public void setSourceLogo(String sourceLogo) {
		this.sourceLogo = sourceLogo;
	}

	public String getSourceFavicon() {
		return sourceFavicon;
	}

	public void setSourceFavicon(String sourceFavicon) {
		this.sourceFavicon = sourceFavicon;
	}

	public Integer getShipCharge() {

		return shipCharge;
	}

	public void setShipCharge(int shipCharge) {
		this.shipCharge = shipCharge;
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

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
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

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getFavicon() {
		return favicon;
	}

	public void setFavicon(String favicon) {
		this.favicon = favicon;
	}

	public void setShipCharge(Integer shipCharge) {
		this.shipCharge = shipCharge;
	}

	@Override
	public String toString() {
		return "CeoVo [id=" + id + ", name=" + name + ", password=" + password + ", phoneNumber=" + phoneNumber
				+ ", email=" + email + ", companyName=" + companyName + ", regDate=" + regDate + ", faxNumber="
				+ faxNumber + ", cpNumber=" + cpNumber + ", address1=" + address1 + ", address2=" + address2
				+ ", postcode=" + postcode + ", address=" + address + ", siteName=" + siteName + ", coNumber="
				+ coNumber + ", cmNumber=" + cmNumber + ", shipCharge=" + shipCharge + ", logo=" + logo + ", favicon="
				+ favicon + ", sourceLogo=" + sourceLogo + ", sourceFavicon=" + sourceFavicon + "]";
	}

}