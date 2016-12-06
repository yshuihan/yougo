package com.yougo.bean;

/**
 * 购物车实体类
 */

public class Shopcart implements java.io.Serializable {
	/**
	 * 购物车编号
	 */
	private Short id;
	/**
	 * 用户 id
	 */
	private Short userid;
	/**
	 * 产品 id
	 */
	private Short proid;
	/**
	 * 产品数量
	 */
	private Short num;
	/**
	 * 购物车总金额
	 */
	private Float price;
	/**
	 * 商品款式 id
	 */
	private Short styleid;
	/**
	 * 创建时间
	 */
	private String createtime;


	public Shopcart() {
	}


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