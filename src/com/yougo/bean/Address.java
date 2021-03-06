package com.yougo.bean;

/**
 * 收货地址实体类
 */

public class Address implements java.io.Serializable {

	private Short id;
	private Short userid;
	private String name;
	private String phone;
	private String adress;
	private String code;


	public Address() {
	}


	public Address(Short userid) {
		this.userid = userid;
	}

	public Address(Short userid, String name, String phone, String adress,
			String code) {
		this.userid = userid;
		this.name = name;
		this.phone = phone;
		this.adress = adress;
		this.code = code;
	}

	public Address(Short id, Short userid, String name, String phone,
			String adress, String code) {
		this.id = id;
		this.userid = userid;
		this.name = name;
		this.phone = phone;
		this.adress = adress;
		this.code = code;
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

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAdress() {
		return this.adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}