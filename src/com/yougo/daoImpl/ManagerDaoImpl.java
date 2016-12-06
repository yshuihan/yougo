package com.yougo.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.yougo.bean.Manager;
import com.yougo.dao.ManagerDao;
import com.yougo.db.Conn;
/**
 * ����Ա������ľ���ʵ��
 * @author Alpha
 *
 */
public class ManagerDaoImpl implements ManagerDao {

	Connection conn = null;
	PreparedStatement pre = null;
	ResultSet rs = null;

	@Override
	public int Manager(Manager manager) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "insert into manager(name,email,password) values(?,?,?)";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1, manager.getName());
			pre.setString(2, manager.getEmail());
			pre.setString(3, manager.getPassword());
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

	public int managerNum(String sql) {
		// TODO Auto-generated method stub
		int i = 0;
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			rs = pre.executeQuery();
			// i = Integer.parseInt(rs.getFetchSize());
			while (rs.next()) {
				i++;
			}
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
	public int updateManager(Manager manager) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "update manager set password=? where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1, manager.getPassword());
			pre.setShort(2, manager.getId());
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
	public int deleteManager(Short id) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "delete from manager where id=?";
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
	public Collection<Manager> getManager(String str) {
		// TODO Auto-generated method stub
		Collection<Manager> groups = new ArrayList<Manager>();
		String sql = str;
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			rs = pre.executeQuery();
			while (rs.next()) {
				Manager mgr = new Manager();
				mgr.setId(rs.getShort("manager.id"));
				mgr.setName(rs.getString("manager.name"));
				mgr.setEmail(rs.getString("manager.email"));
				mgr.setPassword(rs.getString("manager.password"));
				groups.add(mgr);
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
	public Manager findManager(Short id) {
		// TODO Auto-generated method stub
		Manager mgr = new Manager();
		String sql = "select * from manager where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, id);
			rs = pre.executeQuery();
			if (rs.next()) {
				mgr.setId(rs.getShort("manager.id"));
				mgr.setName(rs.getString("manager.name"));
				mgr.setEmail(rs.getString("manager.email"));
				mgr.setPassword(rs.getString("manager.password"));
			} else {
				mgr = null;
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return mgr;
	}

	public Manager isManager(String str) {
		// TODO Auto-generated method stub
		Manager mgr = new Manager();
		String sql = str;
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			rs = pre.executeQuery();
			if (rs.next()) {
				mgr.setId(rs.getShort("manager.id"));
				mgr.setName(rs.getString("manager.name"));
				mgr.setEmail(rs.getString("manager.email"));
				mgr.setPassword(rs.getString("manager.password"));
			} else {
				mgr = null;
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return mgr;
	}

}
