package com.jdbc;

/**
 * Proimages entity. @author MyEclipse Persistence Tools
 */

public class Proimages implements java.io.Serializable {

	// Fields

	private Short id;
	private String imagealt;
	private String imagesrc;
	private Short proid;

	// Constructors

	/** default constructor */
	public Proimages() {
	}

	/** minimal constructor */
	public Proimages(Short proid) {
		this.proid = proid;
	}

	/** full constructor */
	public Proimages(String imagealt, String imagesrc, Short proid) {
		this.imagealt = imagealt;
		this.imagesrc = imagesrc;
		this.proid = proid;
	}

	// Property accessors

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