package com.jdbc;

import java.util.Collection;

public interface ManagerDao {
	public int Manager(Manager manager);
	
	public int managerNum(String sql) ;
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
