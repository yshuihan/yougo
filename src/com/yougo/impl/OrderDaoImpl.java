package com.yougo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.yougo.bean.Order;
import com.yougo.dao.OrderDao;
import com.yougo.db.Conn;

/**
 * 订单数据操作的具体实现
 * 
 * @author Alpha
 * 
 */
public class OrderDaoImpl implements OrderDao {

	Connection conn = null;
	PreparedStatement pre = null;
	ResultSet rs = null;

	@Override
	public int Order(com.yougo.bean.Order order) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "insert into "
				+ "orders(ordernumber,price,context,state,userid,"
				+ "createtime) values(?,?,?,?,?,?)";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1, order.getOrdernumber());
			pre.setFloat(2, order.getPrice());
			pre.setString(3, order.getContext());
			pre.setString(4, "未发货");
			pre.setShort(5, order.getUserid());
			Date now = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = df.format(now);
			pre.setString(6, date);
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

	public int orderNum(String sql) {
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
	public int updateOrder(com.yougo.bean.Order order) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "update orders set ordernumber=?,price=?,context=?,state=?,userid=?,createtime=? where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1, order.getOrdernumber());
			pre.setFloat(2, order.getPrice());
			pre.setString(3, order.getContext());
			pre.setString(4, order.getState());
			pre.setShort(5, order.getUserid());
			Date now = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = df.format(now);
			pre.setString(6, date);
			pre.setShort(7, order.getId());
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

	public int updateOrderState(com.yougo.bean.Order order) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "update orders set state=? where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1, order.getState());
			pre.setShort(2, order.getId());
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
	public int deleteOrder(Short id) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "delete from orders where id=?";
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
	public Collection<com.yougo.bean.Order> getOrder(String str) {
		// TODO Auto-generated method stub
		Collection<Order> groups = new ArrayList<Order>();
		String sql = str;
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			rs = pre.executeQuery();
			while (rs.next()) {
				Order ord = new Order();
				ord.setId(rs.getShort("orders.id"));
				ord.setOrdernumber(rs.getString("orders.ordernumber"));
				ord.setPrice(rs.getFloat("orders.price"));
				ord.setContext(rs.getString("orders.context"));
				ord.setState(rs.getString("orders.state"));
				ord.setUserid(rs.getShort("orders.userid"));
				ord.setCreatetime(rs.getString("orders.createtime"));
				groups.add(ord);
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
	public com.yougo.bean.Order findOrder(Short id) {
		// TODO Auto-generated method stub
		Order ord = new Order();
		String sql = "select * from orders where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, id);
			rs = pre.executeQuery();
			if (rs.next()) {
				ord.setId(rs.getShort("orders.id"));
				ord.setOrdernumber(rs.getString("orders.ordernumber"));
				ord.setPrice(rs.getFloat("orders.price"));
				ord.setContext(rs.getString("orders.context"));
				ord.setState(rs.getString("orders.state"));
				ord.setUserid(rs.getShort("orders.userid"));
				ord.setCreatetime(rs.getString("orders.createtime"));
			} else {
				ord = null;
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return ord;
	}

	public com.yougo.bean.Order findoneOrder(String ordernumber) {
		// TODO Auto-generated method stub
		Order ord = new Order();
		String sql = "select * from orders where ordernumber=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1, ordernumber);
			rs = pre.executeQuery();
			if (rs.next()) {
				ord.setId(rs.getShort("orders.id"));
				ord.setOrdernumber(rs.getString("orders.ordernumber"));
				ord.setPrice(rs.getFloat("orders.price"));
				ord.setContext(rs.getString("orders.context"));
				ord.setState(rs.getString("orders.state"));
				ord.setUserid(rs.getShort("orders.userid"));
				ord.setCreatetime(rs.getString("orders.createtime"));
			} else {
				ord = null;
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		return ord;
	}

}
