package com.douzonemania.shop.vo;

import org.json.JSONObject;

public class CustomDesignVo {
	private int no;
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	private int customIndex;
	private String designID;
	private JSONObject contentsGroup;

	public int getCustomIndex() {
		return customIndex;
	}

	public void setCustomIndex(int customIndex) {
		this.customIndex = customIndex;
	}

	public String getDesignID() {
		return designID;
	}

	public void setDesignID(String designID) {
		this.designID = designID;
	}

	public JSONObject getContentsGroup() {
		return contentsGroup;
	}

	public void setContentsGroup(JSONObject contentsGroup) {
		this.contentsGroup = contentsGroup;
	}

	@Override
	public String toString() {
		return "CustomDesignVo [no=" + no + ", customIndex=" + customIndex + ", designID=" + designID
				+ ", contentsGroup=" + contentsGroup + "]";
	}

}