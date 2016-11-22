package com.yougo.bean;

import java.sql.Timestamp;

/**
 * 购物车实体
 */

public class Shopcart implements java.io.Serializable {

	// Fields

	private Short id;
	private Short userid;
	private Short proid;
	private Short num;
	private Float price;
	private Short styleid;
	private String createtime;

	// Constructors

	/** default constructor */
	public Shopcart() {
	}

	/** minimal constructor */
	public Shopcart(Short userid, Short proid, Short styleid) {
		this.userid = userid;
		this.proid = proid;
		this.styleid = styleid;
	}

	public Shopcart(Short id, Short num, String createtime) {
		this.id = id;
		this.num = num;
		this.createtime = createtime;
	}

	/** full constructor */
	public Shopcart(Short userid, Short proid, Short num, Float price,
			Short styleid, String createtime) {
		this.userid = userid;
		this.proid = proid;
		this.num = num;
		this.price = price;
		this.styleid = styleid;
		this.createtime = createtime;
	}

	// Property accessors

	public Short getId() {
		return this.id;
	}

	public void setId(Short id) {
		this.id = id;
	}

	public Short getUserid() {
		return this.userid;
	}

	public void setUserid(Short userid) {
		this.userid = userid;
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

	public String getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

}