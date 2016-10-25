package com.jdbc;

import java.util.Collection;


public interface AdressDao {
	public int addAdress(Adress adress);
	// 
	public int updateAdress(Adress adress);
	// 
	public int deleteAdress(Short id);
	//
	public Collection<Adress> getAdresss(String str);
	// 
	public Adress findAdress(Short id);
}
