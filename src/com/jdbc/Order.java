package com.jdbc;

import java.sql.Timestamp;

/**
 * Order entity. @author MyEclipse Persistence Tools
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

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** minimal constructor */
	public Order(String ordernumber, Short userid) {
		this.ordernumber = ordernumber;
		this.userid = userid;
	}

	/** full constructor */
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

	// Property accessors

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