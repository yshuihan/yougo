package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.User;

/**
 * 用户实体
 * 
 * @author Alpha
 * 
 */
public interface UserDao {
	/**
	 * 添加用户
	 * 
	 * @param user
	 * @return
	 */
	public int addUser(User user);

	/**
	 * 
	 * @param sql
	 * @return
	 */
	public int userNum(String sql);

	/**
	 * 更新用户
	 * 
	 * @param user
	 * @return
	 */
	public int updateUser(User user);

	/**
	 * 更新密码
	 * 
	 * @param user
	 * @return
	 */
	public int updateUserPassword(User user);

	/**
	 * 更新用户头像
	 * 
	 * @param user
	 * @return
	 */
	public int updateUserHeadImage(User user);

	/**
	 * 删除用户
	 * 
	 * @param id
	 * @return
	 */
	public int deleteUser(Short id);

	/**
	 * 查询用户
	 * 
	 * @param str
	 * @return
	 */
	public Collection<User> getUser(String str);

	/**
	 * 查询用户
	 * 
	 * @param id
	 * @return
	 */
	public User findUser(Short id);

	/**
	 * 是够注册用户
	 * 
	 * @param str
	 * @return
	 */
	public User isUser(String str);
}
