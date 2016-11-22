package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.Manager;

/**
 * 管理员操作接口
 * 
 * @author Alpha
 * 
 */
public interface ManagerDao {
	public int Manager(Manager manager);

	public int managerNum(String sql);

	//
	public int updateManager(Manager manager);

	//
	public int deleteManager(Short id);

	//
	public Collection<Manager> getManager(String str);

	//
	public Manager findManager(Short id);

	public Manager isManager(String str);
}
