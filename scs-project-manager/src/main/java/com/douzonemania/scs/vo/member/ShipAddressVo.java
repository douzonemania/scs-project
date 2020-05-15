package com.douzonemania.scs.vo.member;

public class ShipAddressVo {
	private int no;
	private String shipName;
	private String phoneNumber;
	private String address;
	private boolean recent;
	private int memberNo;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getShipName() {
		return shipName;
	}

	public void setShipName(String shipName) {
		this.shipName = shipName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public boolean isRecent() {
		return recent;
	}

	public void setRecent(boolean recent) {
		this.recent = recent;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "ShipAddressVo [no=" + no + ", shipName=" + shipName + ", phoneNumber=" + phoneNumber + ", address="
				+ address + ", recent=" + recent + ", memberNo=" + memberNo + "]";
	}

}
