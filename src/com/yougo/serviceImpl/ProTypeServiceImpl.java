package com.yougo.serviceImpl;

import java.util.Collection;

import com.yougo.bean.Protype;
import com.yougo.dao.ProtypeDao;
import com.yougo.daoImpl.ProtypeDaoImpl;
import com.yougo.service.ProtypeService;

public class ProTypeServiceImpl implements ProtypeService {
	private ProtypeDao protypeDao;
	public ProTypeServiceImpl() {
		protypeDao=new ProtypeDaoImpl();
	}

	public ProtypeDao getProtypeDao() {
		return protypeDao;
	}

	public void setProtypeDao(ProtypeDao protypeDao) {
		this.protypeDao = protypeDao;
	}

	@Override
	public int addProtype(Protype protype) {
		return protypeDao.addProtype(protype);
	}

	@Override
	public int updateProtype(Protype protype) {
		return protypeDao.updateProtype(protype);
	}

	@Override
	public int deleteProtype(Short id) {
		return protypeDao.deleteProtype(id);
	}

	@Override
	public Collection<Protype> getProtype(String str) {
		return protypeDao.getProtype(str);
	}

	@Override
	public Protype findProtype(Short id) {
		return protypeDao.findProtype(id);
	}

}
