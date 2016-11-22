package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.Order;

/**
 * 订单操作接口
 * @author Alpha
 * 
 */
public interface OrderDao {
	public int Order(Order order);

	public int orderNum(String sql);

	//
	public int updateOrder(Order order);

	//
	public int deleteOrder(Short id);

	//
	public Collection<Order> getOrder(String str);

	//
	public Order findOrder(Short id);

	public com.yougo.bean.Order findoneOrder(String ordernumber);
}
