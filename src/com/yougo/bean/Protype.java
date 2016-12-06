package com.yougo.bean;

/**
 * 产品类型
 */

public class Protype implements java.io.Serializable {


	private Short id;
	private String type;


	public Protype() {
	}


	public Protype(String type) {
		this.type = type;
	}



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