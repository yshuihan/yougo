package com.yougo.serviceImpl;

import java.util.Collection;

import com.yougo.bean.Address;
import com.yougo.dao.AdressDao;
import com.yougo.daoImpl.AddressDaoImpl;
import com.yougo.service.AddressService;

public class AddressServiceImpl implements AddressService {
	
	private AdressDao addressDao;

	public AdressDao getAddressDao() {
		return addressDao;
	}

	public void setAddressDao(AdressDao addressDao) {
		this.addressDao = addressDao;
	}

	public AddressServiceImpl() {
		addressDao=new AddressDaoImpl();
	}

	@Override
	public int addAdress(Address adress) {
		return addressDao.addAdress(adress);
	}

	@Override
	public int updateAdress(Address adress) {
		return addressDao.updateAdress(adress);
	}

	@Override
	public int deleteAdress(Short id) {
		return addressDao.deleteAdress(id);
	}

	@Override
	public Collection<Address> getAdresss(String str) {
		return addressDao.getAdresss(str);
	}

	@Override
	public Address findAdress(Short id) {
		return addressDao.findAdress(id);
	}

}
