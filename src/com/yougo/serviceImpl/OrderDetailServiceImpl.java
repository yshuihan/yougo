package com.yougo.serviceImpl;

import java.util.Collection;

import com.sun.org.apache.regexp.internal.REUtil;
import com.yougo.bean.Orderdetail;
import com.yougo.dao.OrderDao;
import com.yougo.dao.OrderdetailDao;
import com.yougo.daoImpl.OrderdetailImpl;
import com.yougo.service.OrderDetailService;

public class OrderDetailServiceImpl implements OrderDetailService {
	private OrderdetailDao orderdetailDao;

	public OrderDetailServiceImpl() {
		orderdetailDao=new OrderdetailImpl();
	}

	public OrderdetailDao getOrderdetailDao() {
		return orderdetailDao;
	}

	public void setOrderdetailDao(OrderdetailDao orderdetailDao) {
		this.orderdetailDao = orderdetailDao;
	}

	@Override
	public int addOrderdetail(Orderdetail orderdetail) {
		return orderdetailDao.addOrderdetail(orderdetail);
	}

	@Override
	public int orderdetailNum(String sql) {
		return orderdetailDao.orderdetailNum(sql);
	}

	@Override
	public int updateOrderdetail(Orderdetail orderdetail) {
		return orderdetailDao.updateOrderdetail(orderdetail);
	}

	@Override
	public int deleteOrderdetail(Short id) {
		return orderdetailDao.deleteOrderdetail(id);
	}

	@Override
	public Collection<Orderdetail> getOrderdetail(String str) {
		return orderdetailDao.getOrderdetail(str);
	}

	@Override
	public Orderdetail findOrderdetail(Short id) {
		return orderdetailDao.findOrderdetail(id);
	}

}
