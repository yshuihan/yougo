package com.yougo.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.yougo.bean.Address;
import com.yougo.dao.AdressDao;
import com.yougo.db.Conn;
/**
 * 
 * @author Alpha
 *
 */
public class AddressDaoImpl implements AdressDao {

	Connection conn = null;
	PreparedStatement pre = null;
	ResultSet rs = null;

	@Override
	public int addAdress(Address adress) {
		int i = 0;
		String sql = "insert into adress(userid,name,phone,adress,code) values(?,?,?,?,?)";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, adress.getUserid());
			pre.setString(2, adress.getName());
			pre.setString(3, adress.getPhone());
			pre.setString(4, adress.getAdress());
			pre.setString(5, adress.getCode());
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
	public int updateAdress(Address adress) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "update adress set userid=?,name=?,phone=?,adress=?,code=? where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, adress.getUserid());
			pre.setString(2, adress.getName());
			pre.setString(3, adress.getPhone());
			pre.setString(4, adress.getAdress());
			pre.setString(5, adress.getCode());
			pre.setShort(6, adress.getId());
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
	public int deleteAdress(Short id) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "delete from adress where id=?";
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
	public Collection<Address> getAdresss(String str) {
		// TODO Auto-generated method stub
		Collection<Address> groups = new ArrayList<Address>();
		String sql = str;
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			rs = pre.executeQuery();
			while (rs.next()) {
				Address adr = new Address();
				adr.setId(rs.getShort("adress.id"));
				adr.setUserid(rs.getShort("adress.userid"));
				adr.setName(rs.getString("adress.name"));
				adr.setPhone(rs.getString("adress.phone"));
				adr.setAdress(rs.getString("adress.adress"));
				adr.setCode(rs.getString("adress.code"));
				groups.add(adr);
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
	public Address findAdress(Short id) {
		// TODO Auto-generated method stub
		Address adr = new Address();
		String sql = "select * from adress where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, id);
			rs = pre.executeQuery();
			if (rs.next()) {
				adr.setId(rs.getShort("adress.id"));
				adr.setUserid(rs.getShort("adress.userid"));
				adr.setName(rs.getString("adress.name"));
				adr.setPhone(rs.getString("adress.phone"));
				adr.setAdress(rs.getString("adress.adress"));
				adr.setCode(rs.getString("adress.code"));
			} else {
				adr = null;
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return adr;
	}

}
