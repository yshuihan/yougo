package com.yougo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.yougo.bean.Protype;
import com.yougo.dao.ProtypeDao;
import com.yougo.db.Conn;

/**
 * 商品类型操作接口的具体实现
 * 
 * @author Alpha
 * 
 */
public class ProtypeDaoImpl implements ProtypeDao {

	Connection conn = null;
	PreparedStatement pre = null;
	ResultSet rs = null;

	@Override
	public int addProtype(Protype protype) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "insert into protype(type) values(?)";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1, protype.getType());
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
	public int updateProtype(Protype protype) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "update protype set type=? where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1, protype.getType());
			pre.setShort(1, protype.getId());
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
	public int deleteProtype(Short id) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "delete from protype where id=?";
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

	@Override
	public Collection<Protype> getProtype(String str) {
		// TODO Auto-generated method stub
		Collection<Protype> groups = new ArrayList<Protype>();
		String sql = str;
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			rs = pre.executeQuery();
			while (rs.next()) {
				Protype prt = new Protype();
				prt.setId(rs.getShort("protype.id"));
				prt.setType(rs.getString("protype.type"));
				groups.add(prt);
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
	public Protype findProtype(Short id) {
		// TODO Auto-generated method stub
		Protype prt = new Protype();
		String sql = "select * from protype where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, id);
			rs = pre.executeQuery();
			if (rs.next()) {
				prt.setId(rs.getShort("protype.id"));
				prt.setType(rs.getString("protype.type"));
			} else {
				prt = null;
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return prt;
	}

}
