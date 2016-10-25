package com.jdbc;

/**
 * Orderdetail entity. @author MyEclipse Persistence Tools
 */

public class Orderdetail implements java.io.Serializable {

	// Fields

	private Short id;
	private Short orderid;
	private Short proid;
	private Short num;
	private Float price;
	private Short styleid;

	// Constructors

	/** default constructor */
	public Orderdetail() {
	}

	/** minimal constructor */
	public Orderdetail(Short orderid, Short proid, Short styleid) {
		this.orderid = orderid;
		this.proid = proid;
		this.styleid = styleid;
	}

	/** full constructor */
	public Orderdetail(Short orderid, Short proid, Short num, Float price,
			Short styleid) {
		this.orderid = orderid;
		this.proid = proid;
		this.num = num;
		this.price = price;
		this.styleid = styleid;
	}

	// Property accessors

	public Short getId() {
		return this.id;
	}

	public void setId(Short id) {
		this.id = id;
	}

	public Short getOrderid() {
		return this.orderid;
	}

	public void setOrderid(Short orderid) {
		this.orderid = orderid;
	}

	public Short getProid() {
		return this.proid;
	}

	public void setProid(Short proid) {
		this.proid = proid;
	}

	public Short getNum() {
		return this.num;
	}

	public void setNum(Short num) {
		this.num = num;
	}

	public Float getPrice() {
		return this.price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Short getStyleid() {
		return this.styleid;
	}

	public void setStyleid(Short styleid) {
		this.styleid = styleid;
	}

}