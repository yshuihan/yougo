package com.yougo.serviceImpl;

import java.util.Collection;

import com.yougo.bean.User;
import com.yougo.dao.UserDao;
import com.yougo.daoImpl.UserDaoImpl;
import com.yougo.service.UserService;

public class UserServiceImpl implements UserService {
	private UserDao userDao;
	public UserServiceImpl() {
		userDao=new UserDaoImpl();
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public int addUser(User user) {
		return userDao.addUser(user);
	}

	@Override
	public int userNum(String sql) {
		return userDao.userNum(sql);
	}

	@Override
	public int updateUser(User user) {
		return userDao.updateUser(user);
	}

	@Override
	public int updateUserPassword(User user) {
		return userDao.updateUserPassword(user);
	}

	@Override
	public int updateUserHeadImage(User user) {
		return userDao.updateUserHeadImage(user);
	}

	@Override
	public int deleteUser(Short id) {
		return userDao.deleteUser(id);
	}

	@Override
	public Collection<User> getUser(String str) {
		return userDao.getUser(str);
	}

	@Override
	public User findUser(Short id) {
		return userDao.findUser(id);
	}

	@Override
	public User isUser(String str) {
		return userDao.isUser(str);
	}

}
