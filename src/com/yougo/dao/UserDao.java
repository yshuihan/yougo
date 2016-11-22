package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.User;

/**
 * 用户操作接口
 * 
 * @author Alpha
 * 
 */
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
