package com.yougo.serviceImpl;

import java.util.Collection;

import com.yougo.bean.Shopcart;
import com.yougo.dao.ShopcartDao;
import com.yougo.daoImpl.ShopcartDaoImpl;
import com.yougo.service.ShopCartService;

public class ShopCartServiceImpl implements ShopCartService {
	private ShopcartDao shopcartDao;

	public ShopCartServiceImpl() {
		shopcartDao = new ShopcartDaoImpl();
	}

	public ShopcartDao getShopcartDao() {
		return shopcartDao;
	}

	public void setShopcartDao(ShopcartDao shopcartDao) {
		this.shopcartDao = shopcartDao;
	}

	@Override
	public int addShopcart(Shopcart shopcart) {
		return shopcartDao.addShopcart(shopcart);
	}

	@Override
	public int updateShopcart(Shopcart shopcart) {
		return shopcartDao.updateShopcart(shopcart);
	}

	@Override
	public int updateTheShopcart(Shopcart shopcart) {
		return shopcartDao.updateTheShopcart(shopcart);
	}

	@Override
	public int deleteShopcart(Short id) {
		return shopcartDao.deleteShopcart(id);
	}

	@Override
	public int deleteAllShopcart(Short userid) {
		return shopcartDao.deleteAllShopcart(userid);
	}

	@Override
	public Collection<Shopcart> getShopcart(String str) {
		return shopcartDao.getShopcart(str);
	}

	@Override
	public Shopcart findShopcart(Short id) {
		return shopcartDao.findShopcart(id);
	}

	@Override
	public Shopcart findTheShopcart(String str) {
		return shopcartDao.findTheShopcart(str);
	}

}
