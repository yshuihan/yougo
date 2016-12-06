package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.Style;

/**
 * 商品款式实体
 * 
 * @author Alpha
 * 
 */
public interface StyleDao {
	/**
	 * 添加款式
	 * 
	 * @param style
	 * @return
	 */
	public int addStyle(Style style);

	/**
	 * 
	 * @param style
	 * @return
	 */
	public int addtheStyle(Style style);

	/**
	 * 更新款式
	 * 
	 * @param style
	 * @return
	 */
	public int updateStyle(Style style);

	/**
	 * 更新款式
	 * 
	 * @param style
	 * @return
	 */
	public int updatetheStyle(Style style);

	/**
	 * 根据款式 id 删除款式
	 * 
	 * @param id
	 * @return
	 */
	public int deleteStyle(Short id);

	/**
	 * 根据商品 id 删除款式
	 * 
	 * @param pid
	 * @return
	 */
	public int deleteproStyle(Short pid);

	/**
	 * 查询款式信息
	 * 
	 * @param str
	 * @return
	 */
	public Collection<Style> getStyle(String str);

	/**
	 * 查询款式（根据款式 id）
	 * 
	 * @param id
	 * @return
	 */
	public Style findStyle(Short id);

	/**
	 * 根据商品id 查询款式
	 * 
	 * @param proid
	 * @return
	 */
	public Collection<Style> findStyleByProid(Short proid);
}
