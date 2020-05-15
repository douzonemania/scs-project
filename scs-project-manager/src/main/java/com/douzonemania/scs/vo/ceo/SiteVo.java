package com.douzonemania.scs.vo.ceo;

public class SiteVo {
	private int no;
	private String faxNumber;
	private String cpNumber;
	private String ceo;
	private String address;
	private String siteName;
	private String coNumber;
	private String cmNumber;
	private String id;
	private boolean itemReview;
	private boolean itemBoard;
	private int shipCharge;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean isItemReview() {
		return itemReview;
	}

	public void setItemReview(boolean itemReview) {
		this.itemReview = itemReview;
	}

	public boolean isItemBoard() {
		return itemBoard;
	}

	public void setItemBoard(boolean itemBoard) {
		this.itemBoard = itemBoard;
	}

	public int getShipCharge() {
		return shipCharge;
	}

	public void setShipCharge(int shipCharge) {
		this.shipCharge = shipCharge;
	}

	@Override
	public String toString() {
		return "SiteVo [no=" + no + ", faxNumber=" + faxNumber + ", cpNumber=" + cpNumber + ", ceo=" + ceo
				+ ", address=" + address + ", siteName=" + siteName + ", coNumber=" + coNumber + ", cmNumber="
				+ cmNumber + ", id=" + id + ", itemReview=" + itemReview + ", itemBoard=" + itemBoard + ", shipCharge="
				+ shipCharge + "]";
	}

}
