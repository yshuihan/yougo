package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.Orderdetail;

/**
 * ������������ӿ�
 * 
 * @author Alpha
 * 
 */
public interface OrderdetailDao {
	public int addOrderdetail(Orderdetail orderdetail);

	public int orderdetailNum(String sql);

	//
	public int updateOrderdetail(Orderdetail orderdetail);

	//
	public int deleteOrderdetail(Short id);

	//
	public Collection<Orderdetail> getOrderdetail(String str);

	//
	public Orderdetail findOrderdetail(Short id);
}
