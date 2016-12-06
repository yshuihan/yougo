package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.Shopcart;
/**
 * 购物车实体
 * @author Alpha
 *
 */
public interface ShopcartDao {
	/**
	 * 新建购物车
	 * @param shopcart
	 * @return
	 */
	public int addShopcart(Shopcart shopcart);
	/**
	 * 更新购物车
	 * @param shopcart
	 * @return
	 */
	public int updateShopcart(Shopcart shopcart);
	/**
	 * 更新购物车
	 * @param shopcart
	 * @return
	 */
	public int updateTheShopcart(Shopcart shopcart);
	/**
	 * 删除购物车
	 * @param id
	 * @return
	 */
	public int deleteShopcart(Short id);
	/**
	 * 删除所有购物车
	 * @param userid
	 * @return
	 */
	public int deleteAllShopcart(Short userid);
	/**
	 * 查询购物车信息
	 * @param str
	 * @return
	 */
	public Collection<Shopcart> getShopcart(String str);
	/**
	 * 查询购物车信息
	 * @param id
	 * @return
	 */
	public Shopcart findShopcart(Short id);
	/**
	 * 查询购物车信息
	 * @param str
	 * @return
	 */
	public Shopcart findTheShopcart(String str);
}
