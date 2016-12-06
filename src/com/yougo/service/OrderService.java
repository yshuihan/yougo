package com.yougo.service;

import java.util.Collection;

import com.yougo.bean.Order;

public interface OrderService {
	public int Order(Order order);

	public int orderNum(String sql);

	//
	public int updateOrder(Order order);

	public int updateOrderState(Order order);
	//
	public int deleteOrder(Short id);

	//
	public Collection<Order> getOrder(String str);

	//
	public Order findOrder(Short id);

	public com.yougo.bean.Order findoneOrder(String ordernumber);
}
