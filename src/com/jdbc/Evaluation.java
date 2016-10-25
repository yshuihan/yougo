package com.jdbc;

import java.sql.Timestamp;

/**
 * Evaluation entity. @author MyEclipse Persistence Tools
 */

public class Evaluation implements java.io.Serializable {

	// Fields

	private Short id;
	private Short proid;
	private Short userid;
	private String content;
	private Short star;
	private String createtime;

	// Constructors

	/** default constructor */
	public Evaluation() {
	}

	/** minimal constructor */
	public Evaluation(Short proid, Short userid) {
		this.proid = proid;
		this.userid = userid;
	}

	/** full constructor */
	public Evaluation(Short proid, Short userid, String content, Short star,
			String createtime) {
		this.proid = proid;
		this.userid = userid;
		this.content = content;
		this.star = star;
		this.createtime = createtime;
	}

	// Property accessors

	public Short getId() {
		return this.id;
	}

	public void setId(Short id) {
		this.id = id;
	}

	public Short getProid() {
		return this.proid;
	}

	public void setProid(Short proid) {
		this.proid = proid;
	}

	public Short getUserid() {
		return this.userid;
	}

	public void setUserid(Short userid) {
		this.userid = userid;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Short getStar() {
		return this.star;
	}

	public void setStar(Short star) {
		this.star = star;
	}

	public String getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

}