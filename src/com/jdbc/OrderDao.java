package com.jdbc;

import java.util.Collection;

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
	
	public com.jdbc.Order findoneOrder(String ordernumber);
}
