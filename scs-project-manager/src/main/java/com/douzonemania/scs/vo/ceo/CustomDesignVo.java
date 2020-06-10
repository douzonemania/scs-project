package com.douzonemania.scs.vo.ceo;

import org.json.JSONObject;

public class CustomDesignVo {
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
		return "CustomDesignVo [customIndex=" + customIndex + ", designID=" + designID + ", contentsGroup="
				+ contentsGroup + "]";
	}

}