package com.yougo.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.yougo.bean.Product;
import com.yougo.dao.ProductDao;
import com.yougo.db.Conn;

/**
 * 
 * @author Alpha
 * 
 */
public class ProductDaoImpl implements ProductDao {

	Connection conn = null;
	PreparedStatement pre = null;
	ResultSet rs = null;

	@Override
	public int addtheProduct(Product product) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "insert into product(name,typeid,price,oldprice,"
				+ "procode,parameter,groundingstate,grounding,"
				+ "undercarriage,indeximage,allocunt,discount) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1, product.getName());
			pre.setShort(2, product.getTypeid());
			pre.setFloat(3, product.getPrice());
			pre.setFloat(4, product.getOldprice());
			pre.setString(5, product.getProcode());
			pre.setString(6, product.getParameter());
			pre.setString(7, product.getGroundingstate());
			pre.setString(8, product.getGrounding());
			pre.setString(9, product.getUndercarriage());
			pre.setString(10, product.getIndeximage());
			pre.setLong(11, product.getAllocunt());
			pre.setFloat(12, product.getDiscount());
			// System.out.println(product.getName());
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

	public int productNum(String sql) {
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
	public int updateProduct(Product product) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "update product set name=?,typeid=?,price=?,oldprice=?,procode=?,"
				+ "parameter=?,groundingstate=?,grounding=?,undercarriage=?,"
				+ "indeximage=?,clicknum=?,salenum=?,allocunt=?,discount=? where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1, product.getName());
			pre.setShort(2, product.getTypeid());
			pre.setFloat(3, product.getPrice());
			pre.setFloat(4, product.getOldprice());
			pre.setString(5, product.getProcode());
			pre.setString(6, product.getParameter());
			pre.setString(7, product.getGroundingstate());
			pre.setString(8, product.getGrounding());
			pre.setString(9, product.getUndercarriage());
			pre.setString(10, product.getIndeximage());
			pre.setLong(11, product.getClicknum());
			pre.setLong(12, product.getSalenum());
			pre.setLong(13, product.getAllocunt());
			pre.setFloat(14, product.getDiscount());
			pre.setShort(15, product.getId());
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

	public int updatesalenum(Long salenum, Short id) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "update product set salenum=? where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setLong(1, salenum);
			pre.setShort(2, id);
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

	public int updateclicknum(Long clnum, Short id) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "update product set clicknum=? where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setLong(1, clnum);
			pre.setShort(2, id);
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

	public int updateProductImage(Product product) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "update product set indeximage=? where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1, product.getIndeximage());
			pre.setShort(2, product.getId());
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

	public int updateProductEdit(Product product) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "update product set name=?,typeid=?,price=?,oldprice=?,procode=?,"
				+ "parameter=?,groundingstate=?,grounding=?,undercarriage=?,"
				+ "allocunt=?,discount=? where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1, product.getName());
			pre.setShort(2, product.getTypeid());
			pre.setFloat(3, product.getPrice());
			pre.setFloat(4, product.getOldprice());
			pre.setString(5, product.getProcode());
			pre.setString(6, product.getParameter());
			pre.setString(7, product.getGroundingstate());
			pre.setString(8, product.getGrounding());
			pre.setString(9, product.getUndercarriage());
			pre.setLong(10, product.getAllocunt());
			pre.setFloat(11, product.getDiscount());
			pre.setShort(12, product.getId());
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
	public int deleteProduct(Short id) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "delete from product where id=?";
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
	public Collection<Product> getProduct(String str) {
		// TODO Auto-generated method stub
		Collection<Product> groups = new ArrayList<Product>();
		String sql = str;
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			rs = pre.executeQuery();
			while (rs.next()) {
				Product prd = new Product();
				prd.setId(rs.getShort("product.id"));
				prd.setName(rs.getString("product.name"));
				prd.setTypeid(rs.getShort("product.typeid"));
				prd.setPrice(rs.getFloat("product.price"));
				prd.setOldprice(rs.getFloat("product.oldprice"));
				prd.setProcode(rs.getString("product.procode"));
				prd.setParameter(rs.getString("product.parameter"));
				prd.setGroundingstate(rs.getString("product.groundingstate"));
				prd.setGrounding(rs.getString("product.grounding"));
				prd.setUndercarriage(rs.getString("product.undercarriage"));
				prd.setIndeximage(rs.getString("product.indeximage"));
				prd.setClicknum(rs.getLong("product.clicknum"));
				prd.setSalenum(rs.getLong("product.salenum"));
				prd.setAllocunt(rs.getLong("product.allocunt"));
				prd.setDiscount(rs.getFloat("product.discount"));
				groups.add(prd);
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
	public Product findProduct(Short id) {
		// TODO Auto-generated method stub
		Product prd = new Product();
		String sql = "select * from product where id=?";
		try {
			conn = (Connection) Conn.getConnection();
			pre = (PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, id);
			rs = pre.executeQuery();
			if (rs.next()) {
				prd.setId(rs.getShort("product.id"));
				prd.setName(rs.getString("product.name"));
				prd.setTypeid(rs.getShort("product.typeid"));
				prd.setPrice(rs.getFloat("product.price"));
				prd.setOldprice(rs.getFloat("product.oldprice"));
				prd.setProcode(rs.getString("product.procode"));
				prd.setParameter(rs.getString("product.parameter"));
				prd.setGroundingstate(rs.getString("product.groundingstate"));
				prd.setGrounding(rs.getString("product.grounding"));
				prd.setUndercarriage(rs.getString("product.undercarriage"));
				prd.setIndeximage(rs.getString("product.indeximage"));
				prd.setClicknum(rs.getLong("product.clicknum"));
				prd.setSalenum(rs.getLong("product.salenum"));
				prd.setAllocunt(rs.getLong("product.allocunt"));
				prd.setDiscount(rs.getFloat("product.discount"));
			} else {
				prd = null;
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		} finally {
			Conn.release(rs);
			Conn.release(pre);
			Conn.release(conn);
		}
		
		return prd;
	}

}
