package com.douzonemania.shop.vo;

public class StatementVo {

	private int no;
	private String name;
	private String statement;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatement() {
		return statement;
	}
	public void setStatement(String statement) {
		this.statement = statement;
	}
	@Override
	public String toString() {
		return "StatementVo [no=" + no + ", name=" + name + ", statement=" + statement + "]";
	}
}
