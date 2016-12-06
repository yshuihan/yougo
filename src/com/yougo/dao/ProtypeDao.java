package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.Protype;
/**
 * 产品类型实体
 * @author Alpha
 *
 */
public interface ProtypeDao {
	/**
	 * 添加类型
	 * @param protype
	 * @return
	 */
	public int addProtype(Protype protype);
	/**
	 * 更新类型
	 * @param protype
	 * @return
	 */
	public int updateProtype(Protype protype);
	/**
	 * 删除类型
	 * @param id
	 * @return
	 */
	public int deleteProtype(Short id);
	/**
	 * 查询类型
	 * @param str
	 * @return
	 */
	public Collection<Protype> getProtype(String str);
	/**
	 * 查询类型
	 * @param id
	 * @return
	 */
	public Protype findProtype(Short id);
}
