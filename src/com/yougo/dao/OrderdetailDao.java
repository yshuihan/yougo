package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.Orderdetail;

/**
 * 订单详情操作接口
 * 
 * @author Alpha
 * 
 */
public interface OrderdetailDao {
	/**
	 * 添加订单详情
	 * 
	 * @param orderdetail
	 * @return
	 */
	public int addOrderdetail(Orderdetail orderdetail);

	/**
	 * 查询订单中包含的的产品数量
	 * 
	 * @param sql
	 * @return
	 */
	public int orderdetailNum(String sql);

	/**
	 * 更新订单详情
	 * 
	 * @param orderdetail
	 * @return
	 */
	public int updateOrderdetail(Orderdetail orderdetail);

	/**
	 * 删除订单详情
	 * 
	 * @param id
	 * @return
	 */
	public int deleteOrderdetail(Short id);

	/**
	 * 自由查询订单详情
	 * 
	 * @param str
	 * @return
	 */
	public Collection<Orderdetail> getOrderdetail(String str);

	/**
	 * 查询具体订单详情
	 * 
	 * @param id
	 * @return
	 */
	public Orderdetail findOrderdetail(Short id);
}
