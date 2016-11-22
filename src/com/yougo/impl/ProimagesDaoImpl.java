package com.yougo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.yougo.bean.Proimages;
import com.yougo.dao.ProimagesDao;
import com.yougo.db.Conn;

/**
 * 预览照片操作接口的具体实现
 * 
 * @author Alpha
 * 
 */
public class ProimagesDaoImpl implements ProimagesDao {

	Connection conn = null;
	PreparedStatement pre = null;
	ResultSet rs = null;

	@Override
	public int addProimages(Proimages proimages) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "insert into proimages(imagealt,imagesrc,proid) values(?,?,?)";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1, proimages.getImagealt());
			pre.setString(2, proimages.getImagesrc());
			pre.setShort(3, proimages.getProid());
			i = pre.executeUpdate();

		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return i;
	}

	@Override
	public int updateProimages(Proimages proimages) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "update proimages set imagealt=?,imagesrc=?,proid=? where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1, proimages.getImagealt());
			pre.setString(2, proimages.getImagesrc());
			pre.setShort(3, proimages.getProid());
			pre.setShort(4, proimages.getId());
			i = pre.executeUpdate();

		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return i;
	}

	@Override
	public int deleteProimages(Short id) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "delete from proimages where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, id);
			i = pre.executeUpdate();

		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return i;
	}

	public int deleteproProimages(Short pid) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "delete from proimages where proid=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, pid);
			i = pre.executeUpdate();

		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return i;
	}

	@Override
	public Collection<Proimages> getProimages(String str) {
		// TODO Auto-generated method stub
		Collection<Proimages> groups = new ArrayList<Proimages>();
		String sql = str;
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			rs = pre.executeQuery();
			while (rs.next()) {
				Proimages prim = new Proimages();
				prim.setId(rs.getShort("proimages.id"));
				prim.setImagealt(rs.getString("proimages.imagealt"));
				prim.setImagesrc(rs.getString("proimages.imagesrc"));
				prim.setProid(rs.getShort("proimages.proid"));
				groups.add(prim);
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return groups;
	}

	@Override
	public Proimages findProimages(Short id) {
		// TODO Auto-generated method stub
		Proimages prim = new Proimages();
		String sql = "select * from proimages where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, id);
			rs = pre.executeQuery();
			if (rs.next()) {
				prim.setId(rs.getShort("proimages.id"));
				prim.setImagealt(rs.getString("proimages.imagealt"));
				prim.setImagesrc(rs.getString("proimages.imagesrc"));
				prim.setProid(rs.getShort("proimages.proid"));
			} else {
				prim = null;
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return prim;
	}

	public Collection<Proimages> findProimagesByproid(Short proid) {
		// TODO Auto-generated method stub
		Collection<Proimages> groups = new ArrayList<Proimages>();
		String sql = "select * from proimages where proid=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, proid);
			rs = pre.executeQuery();
			while (rs.next()) {
				Proimages prim = new Proimages();
				prim.setId(rs.getShort("proimages.id"));
				prim.setImagealt(rs.getString("proimages.imagealt"));
				prim.setImagesrc(rs.getString("proimages.imagesrc"));
				prim.setProid(rs.getShort("proimages.proid"));
				groups.add(prim);
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return groups;
	}

}
