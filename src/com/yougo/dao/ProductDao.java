package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.Product;

/**
 * 商品操作接口
 * 
 * @author Alpha
 * 
 */
public interface ProductDao {
	/**
	 * 添加商品
	 * 
	 * @param product
	 * @return
	 */
	public int addtheProduct(Product product);

	/**
	 * 查询产品数量
	 * 
	 * @param sql
	 * @return
	 */
	public int productNum(String sql);

	/**
	 * 更新产品信息
	 * 
	 * @param product
	 * @return
	 */
	public int updateProduct(Product product);

	/**
	 * 更新已售信息
	 * 
	 * @param salenum
	 * @param id
	 * @return
	 */
	public int updatesalenum(Long salenum, Short id);

	/**
	 * 更新点击数量
	 * 
	 * @param clnum
	 * @param id
	 * @return
	 */
	public int updateclicknum(Long clnum, Short id);

	/**
	 * 更新产品照片
	 * 
	 * @param product
	 * @return
	 */
	public int updateProductImage(Product product);

	/**
	 * 更新产品参数（html代码块）
	 * 
	 * @param product
	 * @return
	 */
	public int updateProductEdit(Product product);

	/**
	 * 删除商品
	 * 
	 * @param id
	 * @return
	 */
	public int deleteProduct(Short id);

	/**
	 * 自由查询商品信息
	 * 
	 * @param str
	 * @return
	 */
	public Collection<Product> getProduct(String str);

	/**
	 * 查询具体商品信息
	 * 
	 * @param id
	 * @return
	 */
	public Product findProduct(Short id);
}
