package com.yougo.bean;

/**
 * 商品类型实体
 */

public class Protype implements java.io.Serializable {

	// Fields

	private Short id;
	private String type;

	// Constructors

	/** default constructor */
	public Protype() {
	}

	/** full constructor */
	public Protype(String type) {
		this.type = type;
	}

	// Property accessors

	public Short getId() {
		return this.id;
	}

	public void setId(Short id) {
		this.id = id;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

}