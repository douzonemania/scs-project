package com.douzonemania.shop.vo;

public class MainMenuVo {
	
	String first;
	String second;
	String third;
	String fourth;
	String fifth;
	String id;
	
	
	
	public String getFourth() {
		return fourth;
	}
	public void setForth(String fourth) {
		this.fourth = fourth;
	}
	public String getFirst() {
		return first;
	}
	public void setFirst(String first) {
		this.first = first;
	}
	public String getSecond() {
		return second;
	}
	public void setSecond(String second) {
		this.second = second;
	}
	public String getThird() {
		return third;
	}
	public void setThird(String third) {
		this.third = third;
	}
	public String getFifth() {
		return fifth;
	}
	public void setFifth(String fifth) {
		this.fifth = fifth;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "MainMenuVo [first=" + first + ", second=" + second + ", third=" + third + ", fifth=" + fifth + ", id="
				+ id + "]";
	}
	
	
}
