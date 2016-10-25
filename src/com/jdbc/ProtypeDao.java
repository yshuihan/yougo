package com.jdbc;

import java.util.Collection;

public interface ProtypeDao {
	public int addProtype(Protype protype);
	// 
	public int updateProtype(Protype protype);
	// 
	public int deleteProtype(Short id);
	//
	public Collection<Protype> getProtype(String str);
	// 
	public Protype findProtype(Short id);
}
