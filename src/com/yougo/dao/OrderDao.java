package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.Order;

/**
 * 订单（简单）操作接口
 * 
 * @author Alpha
 * 
 */
public interface OrderDao {
	/**
	 * 根据一个订单对象新建订单
	 * 
	 * @param order
	 * @return 数据库索引
	 */
	public int Order(Order order);

	/**
	 * 使用 sql 语句新建订单
	 * 
	 * @param sql
	 * @return 数据库索引
	 */
	public int orderNum(String sql);

	/**
	 * 使用 order 对象更新订单
	 * 
	 * @param order
	 * @return
	 */
	public int updateOrder(Order order);

	/**
	 * 更新订单状态
	 * 
	 * @param order
	 * @return
	 */
	public int updateOrderState(Order order);

	/**
	 * 删除订单
	 * 
	 * @param id
	 * @return
	 */
	public int deleteOrder(Short id);

	/**
	 * 根据 sql 查询订单信息
	 * 
	 * @param str
	 * @return
	 */
	public Collection<Order> getOrder(String str);

	/**
	 * 根据订单编号查询订单信息
	 * 
	 * @param id
	 * @return
	 */
	public Order findOrder(Short id);

	/**
	 * 根据订单序列号查询订单信息
	 * 
	 * @param ordernumber
	 * @return
	 */
	public Order findoneOrder(String ordernumber);
}
