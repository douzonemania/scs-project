package com.douzonemania.scs.vo.member;

public class ItemTopSixVo {
	private String name;
	private String mainImage;
	private int count;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMainImage() {
		return mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "ItemTopSixVo [name=" + name + ", mainImage=" + mainImage + ", count=" + count + "]";
	}

}
