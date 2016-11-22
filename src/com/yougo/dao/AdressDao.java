package com.yougo.dao;

import java.util.Collection;

import com.yougo.bean.Address;

public interface AdressDao {
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
