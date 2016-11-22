package com.yougo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.yougo.bean.Shopcart;
import com.yougo.dao.ShopcartDao;
import com.yougo.db.Conn;

/**
 * 购物车操作接口的具体实现
 * 
 * @author Alpha
 * 
 */
public class ShopcartDaoImpl implements ShopcartDao {

	Connection conn = null;
	PreparedStatement pre = null;
	ResultSet rs = null;

	@Override
	public int addShopcart(Shopcart shopcart) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "insert into shopcart(userid,proid,num,price,styleid,createtime) values(?,?,?,?,?,?)";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, shopcart.getUserid());
			pre.setShort(2, shopcart.getProid());
			pre.setShort(3, shopcart.getNum());
			pre.setFloat(4, shopcart.getPrice());
			pre.setShort(5, shopcart.getStyleid());
			pre.setString(6, shopcart.getCreatetime());
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
	public int updateShopcart(Shopcart shopcart) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "update shopcart set userid=?,proid=?,num=?,price=?,styleid=?,createtime=? where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, shopcart.getUserid());
			pre.setShort(2, shopcart.getProid());
			pre.setShort(3, shopcart.getNum());
			pre.setFloat(4, shopcart.getPrice());
			pre.setShort(5, shopcart.getStyleid());
			pre.setString(6, shopcart.getCreatetime());
			pre.setShort(7, shopcart.getId());
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

	public int updateTheShopcart(Shopcart shopcart) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "update shopcart set num=?,createtime=? where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, shopcart.getNum());
			pre.setString(2, shopcart.getCreatetime());
			pre.setShort(3, shopcart.getId());
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
	public int deleteShopcart(Short id) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "delete from shopcart where id=?";
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

	public int deleteAllShopcart(Short userid) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "delete from shopcart where userid=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, userid);
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
	public Collection<Shopcart> getShopcart(String str) {
		// TODO Auto-generated method stub
		Collection<Shopcart> groups = new ArrayList<Shopcart>();
		String sql = str;
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			rs = pre.executeQuery();
			while (rs.next()) {
				Shopcart spct = new Shopcart();
				spct.setId(rs.getShort("shopcart.id"));
				spct.setUserid(rs.getShort("shopcart.userid"));
				spct.setProid(rs.getShort("shopcart.proid"));
				spct.setNum(rs.getShort("shopcart.num"));
				spct.setPrice(rs.getFloat("shopcart.price"));
				spct.setStyleid(rs.getShort("shopcart.styleid"));
				spct.setCreatetime(rs.getString("shopcart.createtime"));
				groups.add(spct);
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
	public Shopcart findShopcart(Short id) {
		// TODO Auto-generated method stub
		Shopcart spct = new Shopcart();
		String sql = "select * from shopcart where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, id);
			rs = pre.executeQuery();
			if (rs.next()) {
				spct.setId(rs.getShort("shopcart.id"));
				spct.setUserid(rs.getShort("shopcart.userid"));
				spct.setProid(rs.getShort("shopcart.proid"));
				spct.setNum(rs.getShort("shopcart.num"));
				spct.setPrice(rs.getFloat("shopcart.price"));
				spct.setStyleid(rs.getShort("shopcart.styleid"));
				spct.setCreatetime(rs.getString("shopcart.createtime"));
			} else {
				spct = null;
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return spct;
	}

	public Shopcart findTheShopcart(String str) {
		// TODO Auto-generated method stub
		Shopcart spct = new Shopcart();
		String sql = str;
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			rs = pre.executeQuery();
			if (rs.next()) {
				spct.setId(rs.getShort("shopcart.id"));
				spct.setUserid(rs.getShort("shopcart.userid"));
				spct.setProid(rs.getShort("shopcart.proid"));
				spct.setNum(rs.getShort("shopcart.num"));
				spct.setPrice(rs.getFloat("shopcart.price"));
				spct.setStyleid(rs.getShort("shopcart.styleid"));
				spct.setCreatetime(rs.getString("shopcart.createtime"));
			} else {
				spct = null;
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return spct;
	}

}
