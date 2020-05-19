package com.douzonemania.scs.vo.ceo;

public class SiteVo {
	private int no;
	private String ceo;
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

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
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
		return "SiteVo [no=" + no + ", ceo=" + ceo + ", id=" + id + ", itemReview=" + itemReview + ", itemBoard="
				+ itemBoard + ", shipCharge=" + shipCharge + "]";
	}
	
}
