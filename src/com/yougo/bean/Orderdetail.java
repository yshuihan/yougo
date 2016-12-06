package com.yougo.bean;

/**
 * 订单详情实体类
 */

public class Orderdetail implements java.io.Serializable {

	/**
	 * 订单详情的 id
	 */
	private Short id;
	/**
	 * 简单订单 id
	 */
	private Short orderid;
	/**
	 * 产品 id
	 */
	private Short proid;
	/**
	 * 购买数量
	 */
	private Short num;
	/**
	 * 订单总额
	 */
	private Float price;
	/**
	 * 产品款式编号
	 */
	private Short styleid;


	public Orderdetail() {
	}

	public Orderdetail(Short orderid, Short proid, Short styleid) {
		this.orderid = orderid;
		this.proid = proid;
		this.styleid = styleid;
	}

	public Orderdetail(Short orderid, Short proid, Short num, Float price,
			Short styleid) {
		this.orderid = orderid;
		this.proid = proid;
		this.num = num;
		this.price = price;
		this.styleid = styleid;
	}


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