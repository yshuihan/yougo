package com.yougo.bean;

/**
 * 后台管理员实体类
 */

public class Manager implements java.io.Serializable {

	private Short id;
	private String name;
	private String email;
	private String password;

	public Manager() {
	}

	public Manager(String name, String email, String password) {
		this.name = name;
		this.email = email;
		this.password = password;
	}

	public Manager(short id, String password) {
		this.id = id;
		this.password = password;
	}


	public Short getId() {
		return this.id;
	}

	public void setId(Short id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}