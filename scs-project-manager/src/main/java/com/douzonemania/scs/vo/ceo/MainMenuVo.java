package com.douzonemania.scs.vo.ceo;

public class MainMenuVo {
	private String first;
	private String second;
	private String third;
	private String fourth;
	private String fifth;
	private String id;

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

	public String getFourth() {
		return fourth;
	}

	public void setFourth(String fourth) {
		this.fourth = fourth;
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
		return "MainMenuVo [first=" + first + ", second=" + second + ", third=" + third + ", fourth=" + fourth
				+ ", fifth=" + fifth + ", id=" + id + "]";
	}

}
