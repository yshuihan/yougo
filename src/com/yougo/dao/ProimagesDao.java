package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.Proimages;

/**
 * 商品大图序列
 * 
 * @author Alpha
 * 
 */
public interface ProimagesDao {
	/**
	 * 添加商品图片
	 * 
	 * @param proimages
	 * @return
	 */
	public int addProimages(Proimages proimages);

	/**
	 * 更新产品照片
	 * 
	 * @param proimages
	 * @return
	 */
	public int updateProimages(Proimages proimages);

	/**
	 * 更新产品照片
	 * 
	 * @param id
	 * @return
	 */
	public int deleteProimages(Short id);

	/**
	 * 删除产品照片
	 * 
	 * @param pid
	 * @return
	 */
	public int deleteproProimages(Short pid);

	/**
	 * 自由查询产品照片
	 * 
	 * @param str
	 * @return
	 */
	public Collection<Proimages> getProimages(String str);

	/**
	 * 查询产品照片
	 * 
	 * @param id
	 * @return
	 */
	public Proimages findProimages(Short id);

	/**
	 * 根据产品 id 查询 产品照片
	 * 
	 * @param proid
	 * @return
	 */
	public Collection<Proimages> findProimagesByproid(Short proid);
}
