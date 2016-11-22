package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.Shopcart;
/**
 * 购物车操作接口
 * @author Alpha
 *
 */
public interface ShopcartDao {
	public int addShopcart(Shopcart shopcart);
	// 
	public int updateShopcart(Shopcart shopcart);
	
	public int updateTheShopcart(Shopcart shopcart);
	// 
	public int deleteShopcart(Short id);
	public int deleteAllShopcart(Short userid);
	//
	public Collection<Shopcart> getShopcart(String str);
	// 
	public Shopcart findShopcart(Short id);
	
	public Shopcart findTheShopcart(String str);
}
