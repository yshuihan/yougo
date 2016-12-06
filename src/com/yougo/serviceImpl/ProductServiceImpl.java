package com.yougo.serviceImpl;

import java.util.Collection;

import com.yougo.bean.Product;
import com.yougo.dao.ProductDao;
import com.yougo.daoImpl.ProductDaoImpl;
import com.yougo.service.ProductService;

public class ProductServiceImpl implements ProductService {

	private ProductDao productDao;
	public ProductServiceImpl() {
		productDao=new ProductDaoImpl();
	}

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	public int addtheProduct(Product product) {
		return productDao.addtheProduct(product);
	}

	@Override
	public int productNum(String sql) {
		return productDao.productNum(sql);
	}

	@Override
	public int updateProduct(Product product) {
		return productDao.updateProduct(product);
	}

	@Override
	public int updatesalenum(Long salenum, Short id) {
		return productDao.updatesalenum(salenum, id);
	}

	@Override
	public int updateclicknum(Long clnum, Short id) {
		return productDao.updateclicknum(clnum, id);
	}

	@Override
	public int updateProductImage(Product product) {
		return productDao.updateProductImage(product);
	}

	@Override
	public int updateProductEdit(Product product) {
		return productDao.updateProductEdit(product);
	}

	@Override
	public int deleteProduct(Short id) {
		return productDao.deleteProduct(id);
	}

	@Override
	public Collection<Product> getProduct(String str) {
		return productDao.getProduct(str);
	}

	@Override
	public Product findProduct(Short id) {
		return productDao.findProduct(id);
	}

}
