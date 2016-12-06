package com.yougo.serviceImpl;

import java.util.Collection;

import com.yougo.service.OrderService;
import com.yougo.bean.Order;
import com.yougo.dao.OrderDao;
import com.yougo.daoImpl.OrderDaoImpl;

public class OrderServiceImpl implements OrderService {

	private OrderDao orderDao;
	public OrderServiceImpl() {
		orderDao=new OrderDaoImpl();
	}

	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public int Order(Order order) {
		return orderDao.Order(order);
	}

	@Override
	public int orderNum(String sql) {
		return orderDao.orderNum(sql);
	}

	@Override
	public int updateOrder(Order order) {
		return orderDao.updateOrder(order);
	}

	@Override
	public int deleteOrder(Short id) {
		return orderDao.deleteOrder(id);
	}

	@Override
	public Collection<Order> getOrder(String str) {
		return orderDao.getOrder(str);
	}

	@Override
	public Order findOrder(Short id) {
		return orderDao.findOrder(id);
	}

	@Override
	public Order findoneOrder(String ordernumber) {
		return orderDao.findoneOrder(ordernumber);
	}

	@Override
	public int updateOrderState(Order order) {
		return orderDao.updateOrderState(order);
	}

}
