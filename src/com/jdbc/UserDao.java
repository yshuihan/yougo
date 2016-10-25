package com.jdbc;

import java.util.Collection;

public interface UserDao {
	public int addUser(User user);
	
	public int userNum(String sql);
	// 
	public int updateUser(User user);
	
	public int updateUserPassword(User user);
	
	public int updateUserHeadImage(User user);
	// 
	public int deleteUser(Short id);
	//
	public Collection<User> getUser(String str);
	// 
	public User findUser(Short id);
	public User isUser(String str);
}
