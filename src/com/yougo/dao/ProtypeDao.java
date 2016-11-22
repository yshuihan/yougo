package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.Protype;
/**
 * 商品类型操作接口
 * @author Alpha
 *
 */
public interface ProtypeDao {
	public int addProtype(Protype protype);
	// 
	public int updateProtype(Protype protype);
	// 
	public int deleteProtype(Short id);
	//
	public Collection<Protype> getProtype(String str);
	// 
	public Protype findProtype(Short id);
}
