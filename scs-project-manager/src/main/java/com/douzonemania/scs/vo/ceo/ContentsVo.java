package com.douzonemania.scs.vo.ceo;

public class ContentsVo {
	private int no;
	private int customNo;
	private int index;
	private int customIndex;
	private String content;
	private String designId;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCustomNo() {
		return customNo;
	}
	public void setCustomNo(int customNo) {
		this.customNo = customNo;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getCustomIndex() {
		return customIndex;
	}
	public void setCustomIndex(int customIndex) {
		this.customIndex = customIndex;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDesignId() {
		return designId;
	}
	public void setDesignId(String designId) {
		this.designId = designId;
	}
	
	@Override
	public String toString() {
		return "ContentsVo [no=" + no + ", customNo=" + customNo + ", index=" + index + ", customIndex=" + customIndex
				+ ", content=" + content + ", designId=" + designId + "]";
	}
	
	


	
}
