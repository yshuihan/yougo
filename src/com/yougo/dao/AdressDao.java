package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.Address;

/**
 * 地址操作接口
 * 
 * @author Alpha
 * 
 */
public interface AdressDao {
	/**
	 * 由地址对象新建新的地址
	 * 
	 * @param adress
	 * @return
	 */
	public int addAdress(Address adress);

	/**
	 * 由地址对象更新地址信息
	 * 
	 * @param adress
	 * @return
	 */
	public int updateAdress(Address adress);

	/**
	 * 根据地址id删除地址信息
	 * 
	 * @param id
	 * @return
	 */
	public int deleteAdress(Short id);

	/**
	 * 根据 sql 查询地址信息
	 * 
	 * @param str
	 * @return
	 */
	public Collection<Address> getAdresss(String str);

	/**
	 * 根据地址编号查询地址信息
	 * 
	 * @param id
	 * @return
	 */
	public Address findAdress(Short id);
}
