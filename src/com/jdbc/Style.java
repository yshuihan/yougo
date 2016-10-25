package com.jdbc;

/**
 * Style entity. @author MyEclipse Persistence Tools
 */

public class Style implements java.io.Serializable {

	// Fields

	private Short id;
	private String name;
	private String image;
	private Short proid;
	private Float perPrice;
	private Float oldperprice;

	// Constructors

	/** default constructor */
	public Style() {
	}

	/** minimal constructor */
	public Style(Short proid) {
		this.proid = proid;
	}

	/** full constructor */
	public Style(String name, String image, Short proid, Float perPrice,
			Float oldperprice) {
		this.name = name;
		this.image = image;
		this.proid = proid;
		this.perPrice = perPrice;
		this.oldperprice = oldperprice;
	}
	public Style(String name, String image, Short proid) {
		this.name = name;
		this.image = image;
		this.proid = proid;
	}
	public Style(Short id,String name, String image) {
		this.id = id;
		this.name = name;
		this.image = image;
	}

	// Property accessors

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

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Short getProid() {
		return this.proid;
	}

	public void setProid(Short proid) {
		this.proid = proid;
	}

	public Float getPerPrice() {
		return this.perPrice;
	}

	public void setPerPrice(Float perPrice) {
		this.perPrice = perPrice;
	}

	public Float getOldperprice() {
		return this.oldperprice;
	}

	public void setOldperprice(Float oldperprice) {
		this.oldperprice = oldperprice;
	}

}