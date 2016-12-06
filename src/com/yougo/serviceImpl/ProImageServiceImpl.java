package com.yougo.serviceImpl;

import java.util.Collection;

import com.yougo.bean.Proimages;
import com.yougo.dao.ProimagesDao;
import com.yougo.daoImpl.ProimagesDaoImpl;
import com.yougo.service.ProimageService;

public class ProImageServiceImpl implements ProimageService {
	private ProimagesDao proimagesDao;

	public ProImageServiceImpl() {
		proimagesDao = new ProimagesDaoImpl();
	}

	public ProimagesDao getProimagesDao() {
		return proimagesDao;
	}

	public void setProimagesDao(ProimagesDao proimagesDao) {
		this.proimagesDao = proimagesDao;
	}

	@Override
	public int addProimages(Proimages proimages) {
		return proimagesDao.addProimages(proimages);
	}

	@Override
	public int updateProimages(Proimages proimages) {
		return proimagesDao.updateProimages(proimages);
	}

	@Override
	public int deleteProimages(Short id) {
		return proimagesDao.deleteProimages(id);
	}

	@Override
	public int deleteproProimages(Short pid) {
		return proimagesDao.deleteproProimages(pid);
	}

	@Override
	public Collection<Proimages> getProimages(String str) {
		return proimagesDao.getProimages(str);
	}

	@Override
	public Proimages findProimages(Short id) {
		return proimagesDao.findProimages(id);
	}

	@Override
	public Collection<Proimages> findProimagesByproid(Short proid) {
		return proimagesDao.findProimagesByproid(proid);
	}

}
