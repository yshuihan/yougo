package com.yougo.bean;

/**
 * 简单订单实体类（不包含订单内容）
 */

public class Order implements java.io.Serializable {

	// Fields

	private Short id;
	private String ordernumber;
	private Float price;
	private String context;
	private String state;
	private Short userid;
	private String createtime;


	public Order() {
	}


	public Order(String ordernumber, Short userid) {
		this.ordernumber = ordernumber;
		this.userid = userid;
	}


	public Order(String ordernumber, Float price, String context, String state,
			Short userid, String createtime) {
		this.ordernumber = ordernumber;
		this.price = price;
		this.context = context;
		this.state = state;
		this.userid = userid;
		this.createtime = createtime;
	}

	public Order(short id, String state) {
		this.id = id;
		this.state = state;
	}


	public Short getId() {
		return this.id;
	}

	public void setId(Short id) {
		this.id = id;
	}

	public String getOrdernumber() {
		return this.ordernumber;
	}

	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}

	public Float getPrice() {
		return this.price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getContext() {
		return this.context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Short getUserid() {
		return this.userid;
	}

	public void setUserid(Short userid) {
		this.userid = userid;
	}

	public String getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

}