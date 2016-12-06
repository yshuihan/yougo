package com.yougo.serviceImpl;

import java.util.Collection;

import com.yougo.bean.Style;
import com.yougo.dao.StyleDao;
import com.yougo.daoImpl.StyleDaoImpl;
import com.yougo.service.StyleService;

public class StyleServiceImpl implements StyleService {
	private StyleDao styleDao;
	public StyleServiceImpl() {
		styleDao=new StyleDaoImpl();
	}

	public StyleDao getStyleDao() {
		return styleDao;
	}

	public void setStyleDao(StyleDao styleDao) {
		this.styleDao = styleDao;
	}

	@Override
	public int addStyle(Style style) {
		return styleDao.addStyle(style);
	}

	@Override
	public int addtheStyle(Style style) {
		return styleDao.addtheStyle(style);
	}

	@Override
	public int updateStyle(Style style) {
		return styleDao.updateStyle(style);
	}

	@Override
	public int updatetheStyle(Style style) {
		return styleDao.updatetheStyle(style);
	}

	@Override
	public int deleteStyle(Short id) {
		return styleDao.deleteStyle(id);
	}

	@Override
	public int deleteproStyle(Short pid) {
		return styleDao.deleteproStyle(pid);
	}

	@Override
	public Collection<Style> getStyle(String str) {
		return styleDao.getStyle(str);
	}

	@Override
	public Style findStyle(Short id) {
		return styleDao.findStyle(id);
	}

	@Override
	public Collection<Style> findStyleByProid(Short proid) {
		return styleDao.findStyleByProid(proid);
	}

}
