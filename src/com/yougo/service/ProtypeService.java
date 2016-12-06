package com.yougo.service;

import java.util.Collection;

import com.yougo.bean.Protype;

public interface ProtypeService {
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
