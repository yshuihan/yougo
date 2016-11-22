package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.Product;

/**
 * ��Ʒ�����ӿ�
 * 
 * @author Alpha
 * 
 */
public interface ProductDao {
	public int addtheProduct(Product product);

	public int productNum(String sql);

	//
	public int updateProduct(Product product);

	public int updatesalenum(Long salenum, Short id);

	public int updateclicknum(Long clnum, Short id);

	public int updateProductImage(Product product);

	public int updateProductEdit(Product product);

	//
	public int deleteProduct(Short id);

	//
	public Collection<Product> getProduct(String str);

	//
	public Product findProduct(Short id);
}