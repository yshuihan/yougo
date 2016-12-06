package com.yougo.service;

import java.util.Collection;

import com.yougo.bean.Address;

public interface AddressService {
	public int addAdress(Address adress);

	//
	public int updateAdress(Address adress);

	//
	public int deleteAdress(Short id);

	//
	public Collection<Address> getAdresss(String str);

	//
	public Address findAdress(Short id);
}
