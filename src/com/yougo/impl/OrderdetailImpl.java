package com.yougo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.yougo.bean.Orderdetail;
import com.yougo.dao.OrderdetailDao;
import com.yougo.db.Conn;

/**
 * 订单详情操作的实现
 * @author Alpha
 * 
 */
public class OrderdetailImpl implements OrderdetailDao {

	Connection conn = null;
	PreparedStatement pre = null;
	ResultSet rs = null;

	@Override
	public int addOrderdetail(Orderdetail orderdetail) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "insert into orderdetail(orderid,proid,num,price,styleid) values(?,?,?,?,?)";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, orderdetail.getOrderid());
			pre.setShort(2, orderdetail.getProid());
			pre.setShort(3, orderdetail.getNum());
			pre.setFloat(4, orderdetail.getPrice());
			pre.setShort(5, orderdetail.getStyleid());
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

	public int orderdetailNum(String sql) {
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
	public int updateOrderdetail(Orderdetail orderdetail) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "update orderdetail set orderid=?,proid=?,num=?,price=?,styleid=? where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			// pre=(PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, orderdetail.getOrderid());
			pre.setShort(2, orderdetail.getProid());
			pre.setShort(3, orderdetail.getNum());
			pre.setFloat(4, orderdetail.getPrice());
			pre.setShort(5, orderdetail.getStyleid());
			pre.setShort(6, orderdetail.getId());
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
	public int deleteOrderdetail(Short id) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "delete from orderdetail where id=?";
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
	public Collection<Orderdetail> getOrderdetail(String str) {
		// TODO Auto-generated method stub
		Collection<Orderdetail> groups = new ArrayList<Orderdetail>();
		String sql = str;
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			rs = pre.executeQuery();
			while (rs.next()) {
				Orderdetail ordt = new Orderdetail();
				ordt.setId(rs.getShort("orderdetail.id"));
				ordt.setOrderid(rs.getShort("orderdetail.orderid"));
				ordt.setProid(rs.getShort("orderdetail.proid"));
				ordt.setNum(rs.getShort("orderdetail.num"));
				ordt.setPrice(rs.getFloat("orderdetail.price"));
				ordt.setStyleid(rs.getShort("orderdetail.styleid"));
				groups.add(ordt);
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
	public Orderdetail findOrderdetail(Short id) {
		// TODO Auto-generated method stub
		Orderdetail ordt = new Orderdetail();
		String sql = "select * from orderdetail where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, id);
			rs = pre.executeQuery();
			if (rs.next()) {
				ordt.setId(rs.getShort("orderdetail.id"));
				ordt.setOrderid(rs.getShort("orderdetail.orderid"));
				ordt.setProid(rs.getShort("orderdetail.proid"));
				ordt.setNum(rs.getShort("orderdetail.num"));
				ordt.setPrice(rs.getFloat("orderdetail.price"));
				ordt.setStyleid(rs.getShort("orderdetail.styleid"));
			} else {
				ordt = null;
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return ordt;
	}

}
