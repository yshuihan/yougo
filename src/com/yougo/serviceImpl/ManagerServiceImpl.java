package com.yougo.serviceImpl;

import java.util.Collection;

import com.yougo.dao.ManagerDao;
import com.yougo.daoImpl.ManagerDaoImpl;
import com.yougo.service.ManagerService;
import com.yougo.bean.Manager;

public class ManagerServiceImpl implements ManagerService {

	private ManagerDao managerDao;
	
	public ManagerServiceImpl() {
		managerDao=new ManagerDaoImpl();
	}

	public ManagerDao getManagerDao() {
		return managerDao;
	}

	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}

	@Override
	public int Manager(Manager manager) {
		return managerDao.Manager(manager);
	}

	@Override
	public int managerNum(String sql) {
		return managerDao.managerNum(sql);
	}

	@Override
	public int updateManager(Manager manager) {
		return managerDao.updateManager(manager);
	}

	@Override
	public int deleteManager(Short id) {
		return managerDao.deleteManager(id);
	}

	@Override
	public Collection<Manager> getManager(String str) {
		return managerDao.getManager(str);
	}

	@Override
	public Manager findManager(Short id) {
		return managerDao.findManager(id);
	}

	@Override
	public Manager isManager(String str) {
		return managerDao.isManager(str);
	}

}
