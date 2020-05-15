package com.douzonemania.scs.vo.ceo;

public class AgreementVo {
	private String firstAgree;
	private String secondAgree;
	private String thirdAgree;
	private String id;

	public String getFirstAgree() {
		return firstAgree;
	}

	public void setFirstAgree(String firstAgree) {
		this.firstAgree = firstAgree;
	}

	public String getSecondAgree() {
		return secondAgree;
	}

	public void setSecondAgree(String secondAgree) {
		this.secondAgree = secondAgree;
	}

	public String getThirdAgree() {
		return thirdAgree;
	}

	public void setThirdAgree(String thirdAgree) {
		this.thirdAgree = thirdAgree;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "AgreementVo [firstAgree=" + firstAgree + ", secondAgree=" + secondAgree + ", thirdAgree=" + thirdAgree
				+ ", id=" + id + "]";
	}

}
