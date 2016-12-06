package com.yougo.bean;

/**
 * 商品实体类
 */

public class Product implements java.io.Serializable {
	/**
	 * 商品 id
	 */
	private Short id;
	/**
	 * 商品名称
	 */
	private String name;
	/**
	 * 商品款式
	 */
	private Short typeid;
	/**
	 * 商品单价
	 */
	private Float price;
	/**
	 * 原价
	 */
	private Float oldprice;
	/**
	 * 商品编号（厂家编号）
	 */
	private String procode;
	/**
	 * 商品参数（html代码块）
	 */
	private String parameter;
	/**
	 * 上架状态
	 */
	private String groundingstate;
	/**
	 * 上架时间
	 */
	private String grounding;
	/**
	 * 下架时间
	 */
	private String undercarriage;
	/**
	 * 商品图片（小）
	 */
	private String indeximage;
	/**
	 * 点击次数
	 */
	private Long clicknum;
	/**
	 * 已售数量
	 */
	private Long salenum;
	/**
	 * 商品数量
	 */
	private Long allocunt;
	/**
	 * 商品折扣
	 */
	private Float discount;

	public Product() {
	}


	public Product(Short id, Short typeid) {
		this.id = id;
		this.typeid = typeid;
	}


	public Product(String name, Short typeid, Float price, Float oldprice,
			String procode, String parameter, String groundingstate,
			String grounding, String undercarriage, String indeximage,
			Long clicknum, Long salenum, Long allocunt, Float discount) {
		this.name = name;
		this.typeid = typeid;
		this.price = price;
		this.oldprice = oldprice;
		this.procode = procode;
		this.parameter = parameter;
		this.grounding = grounding;
		this.groundingstate = groundingstate;
		this.undercarriage = undercarriage;
		this.indeximage = indeximage;
		this.clicknum = clicknum;
		this.salenum = salenum;
		this.allocunt = allocunt;
		this.discount = discount;
	}

	public Product(String name, Short typeid, Float price, Float oldprice,
			String procode, String parameter, String groundingstate,
			String grounding, String undercarriage, String indeximage,
			Long allocunt, Float discount) {
		this.name = name;
		this.typeid = typeid;
		this.price = price;
		this.oldprice = oldprice;
		this.procode = procode;
		this.parameter = parameter;
		this.grounding = grounding;
		this.groundingstate = groundingstate;
		this.undercarriage = undercarriage;
		this.indeximage = indeximage;
		this.allocunt = allocunt;
		this.discount = discount;
	}

	public Product(Short id, String name, Short typeid, Float price,
			Float oldprice, String procode, String parameter,
			String groundingstate, String grounding, String undercarriage,
			Long allocunt, Float discount) {
		this.id = id;
		this.name = name;
		this.typeid = typeid;
		this.price = price;
		this.oldprice = oldprice;
		this.procode = procode;
		this.parameter = parameter;
		this.grounding = grounding;
		this.groundingstate = groundingstate;
		this.undercarriage = undercarriage;
		this.allocunt = allocunt;
		this.discount = discount;
	}

	public Product(Short id, String indeximage) {
		this.id = id;
		this.indeximage = indeximage;
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

	public Short getTypeid() {
		return this.typeid;
	}

	public void setTypeid(Short typeid) {
		this.typeid = typeid;
	}

	public Float getPrice() {
		return this.price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getOldprice() {
		return this.oldprice;
	}

	public void setOldprice(Float oldprice) {
		this.oldprice = oldprice;
	}

	public String getProcode() {
		return this.procode;
	}

	public void setProcode(String procode) {
		this.procode = procode;
	}

	public String getParameter() {
		return this.parameter;
	}

	public void setParameter(String parameter) {
		this.parameter = parameter;
	}

	public String getGroundingstate() {
		return this.groundingstate;
	}

	public void setGroundingstate(String groundingstate) {
		this.groundingstate = groundingstate;
	}

	public String getGrounding() {
		return this.grounding;
	}

	public void setGrounding(String grounding) {
		this.grounding = grounding;
	}

	public String getUndercarriage() {
		return this.undercarriage;
	}

	public void setUndercarriage(String undercarriage) {
		this.undercarriage = undercarriage;
	}

	public String getIndeximage() {
		return this.indeximage;
	}

	public void setIndeximage(String indeximage) {
		this.indeximage = indeximage;
	}

	public Long getClicknum() {
		return this.clicknum;
	}

	public void setClicknum(Long clicknum) {
		this.clicknum = clicknum;
	}

	public Long getSalenum() {
		return this.salenum;
	}

	public void setSalenum(Long salenum) {
		this.salenum = salenum;
	}

	public Long getAllocunt() {
		return this.allocunt;
	}

	public void setAllocunt(Long allocunt) {
		this.allocunt = allocunt;
	}

	public Float getDiscount() {
		return this.discount;
	}

	public void setDiscount(Float discount) {
		this.discount = discount;
	}

	/*@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", typeid=" + typeid
				+ ", price=" + price + ", oldprice=" + oldprice + ", procode="
				+ procode + ", groundingstate="
				+ groundingstate + ", grounding=" + grounding
				+ ", undercarriage=" + undercarriage + ", indeximage="
				+ indeximage + ", clicknum=" + clicknum + ", salenum="
				+ salenum + ", allocunt=" + allocunt + ", discount=" + discount
				+ "]";
	}*/

}