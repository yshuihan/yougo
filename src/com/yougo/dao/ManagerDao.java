package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.Manager;

/**
 * 后台管理员操作接口
 * 
 * @author Alpha
 * 
 */
public interface ManagerDao {
	/**
	 * 根据对象新建管理员
	 * 
	 * @param manager
	 * @return
	 */
	public int Manager(Manager manager);

	/**
	 * 查询管理员数量
	 * 
	 * @param sql
	 * @return
	 */
	public int managerNum(String sql);

	/**
	 * 更新管理员
	 * 
	 * @param manager
	 * @return
	 */
	public int updateManager(Manager manager);

	/**
	 * 删除管理员
	 * 
	 * @param id
	 * @return
	 */
	public int deleteManager(Short id);

	/**
	 * 查询管理员信息
	 * 
	 * @param str
	 * @return
	 */
	public Collection<Manager> getManager(String str);

	/**
	 * 查询单个管理员信息
	 * 
	 * @param id
	 * @return
	 */
	public Manager findManager(Short id);

	/**
	 * 验证是否是管理员
	 * 
	 * @param str
	 * @return
	 */
	public Manager isManager(String str);
}
