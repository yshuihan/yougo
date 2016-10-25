package com.jdbc;

import java.util.Collection;

public interface ProimagesDao {
	public int addProimages(Proimages proimages);
	// 
	public int updateProimages(Proimages proimages);
	// 
	public int deleteProimages(Short id);
	public int deleteproProimages(Short pid);
	//
	public Collection<Proimages> getProimages(String str);
	// 
	public Proimages findProimages(Short id);
	public Collection<Proimages> findProimagesByproid(Short proid);
}
