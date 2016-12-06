package com.yougo.bean;

/**
 * 产品图片（大）
 */

public class Proimages implements java.io.Serializable {

	/**
	 * 图片 id
	 */
	private Short id;
	/**
	 * 图片描述
	 */
	private String imagealt;
	/**
	 * 图片路径地址
	 */
	private String imagesrc;
	/**
	 * 对应的产品 id
	 */
	private Short proid;

	public Proimages() {
	}

	public Proimages(Short proid) {
		this.proid = proid;
	}

	public Proimages(String imagealt, String imagesrc, Short proid) {
		this.imagealt = imagealt;
		this.imagesrc = imagesrc;
		this.proid = proid;
	}

	public Short getId() {
		return this.id;
	}

	public void setId(Short id) {
		this.id = id;
	}

	public String getImagealt() {
		return this.imagealt;
	}

	public void setImagealt(String imagealt) {
		this.imagealt = imagealt;
	}

	public String getImagesrc() {
		return this.imagesrc;
	}

	public void setImagesrc(String imagesrc) {
		this.imagesrc = imagesrc;
	}

	public Short getProid() {
		return this.proid;
	}

	public void setProid(Short proid) {
		this.proid = proid;
	}

}