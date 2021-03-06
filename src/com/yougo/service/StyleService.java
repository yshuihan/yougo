package com.yougo.service;

import java.util.Collection;

import com.yougo.bean.Style;

public interface StyleService {
	public int addStyle(Style style);

	public int addtheStyle(Style style);

	//
	public int updateStyle(Style style);

	public int updatetheStyle(Style style);

	//
	public int deleteStyle(Short id);

	public int deleteproStyle(Short pid);

	//
	public Collection<Style> getStyle(String str);

	//
	public Style findStyle(Short id);

	public Collection<Style> findStyleByProid(Short proid);
}
