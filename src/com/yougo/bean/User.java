package com.yougo.bean;

/**
 * 用户实体类
 */

public class User implements java.io.Serializable {
	/**
	 * 用户 id
	 */
	private Short id;
	/**
	 * 用户名
	 */
	private String name;
	/**
	 * 邮箱地址
	 */
	private String email;
	/**
	 * 密码
	 */
	private String password;
	/**
	 * 用户头像照片路径
	 */
	private String headimage;
	/**
	 * 手机号
	 */
	private String phone;
	/**
	 * qq
	 */
	private String qq;
	/**
	 * 出生日期
	 */
	private String birthday;
	/**
	 * 收货地址
	 */
	private String adress;
	/**
	 * 用户等级
	 */
	private Short level;

	public User() {
	}

	public User(String name, String email, String password) {
		this.name = name;
		this.email = email;
		this.password = password;
	}

	public User(String name, String email, String password, String headimage,
			String phone, String qq, String birthday, String adress, Short level) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.headimage = headimage;
		this.phone = phone;
		this.qq = qq;
		this.birthday = birthday;
		this.adress = adress;
		this.level = level;
	}

	public User(Short id, String name, String email, String phone, String qq,
			String birthday, String adress) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.qq = qq;
		this.birthday = birthday;
		this.adress = adress;
	}

	public User(Short id, String password) {
		this.id = id;
		this.password = password;
	}

	public User(String headimage, Short id) {
		this.id = id;
		this.headimage = headimage;
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

	public String getHeadimage() {
		return this.headimage;
	}

	public void setHeadimage(String headimage) {
		this.headimage = headimage;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getBirthday() {
		return this.birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAdress() {
		return this.adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public Short getLevel() {
		return this.level;
	}

	public void setLevel(Short level) {
		this.level = level;
	}

}