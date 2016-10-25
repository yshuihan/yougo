package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class StyleDaoImpl implements StyleDao{

	Connection conn = null;
	PreparedStatement pre = null;
	ResultSet rs = null;
	@Override
	public int addStyle(Style style) {
		// TODO Auto-generated method stub
		int i=0;
    	String sql="insert into style(name,image,proid,perPrice,oldperprice) values(?,?,?,?,?)";
    	try{
    		conn=(Connection) Conn.getConnection();
    		pre=(PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1,style.getName());
			pre.setString(2,style.getImage());
			pre.setShort(3,style.getProid());
			pre.setFloat(4,style.getPerPrice());
			pre.setFloat(5,style.getOldperprice());
			i=pre.executeUpdate();
			
    	}catch(SQLException e){
  	      System.out.print(e.getMessage());
  	    }finally{
  	    	Conn.release(rs);
  	    	Conn.release(pre);
  	    	Conn.release(conn);
    	}
		return i;
	}
	
	public int addtheStyle(Style style) {
		// TODO Auto-generated method stub
		int i=0;
    	String sql="insert into style(name,image,proid) values(?,?,?)";
    	try{
    		conn=(Connection) Conn.getConnection();
    		pre=(PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1,style.getName());
			pre.setString(2,style.getImage());
			pre.setShort(3,style.getProid());
			//System.out.println(pre.getPreparedSql());
			i=pre.executeUpdate();
			
    	}catch(SQLException e){
  	      System.out.print(e.getMessage());
  	    }finally{
  	    	Conn.release(rs);
  	    	Conn.release(pre);
  	    	Conn.release(conn);
    	}
		return i;
	}

	@Override
	public int updateStyle(Style style) {
		// TODO Auto-generated method stub
		int i=0;
    	String sql="update style set name=?,image=?,proid=?,perPrice=?,oldperprice=? where id=?";
    	try{
    		conn=(Connection) Conn.getConnection();
    		pre=(PreparedStatement) conn.prepareStatement(sql);
    		pre.setString(1,style.getName());
			pre.setString(2,style.getImage());
			pre.setShort(3,style.getProid());
			pre.setFloat(4,style.getPerPrice());
			pre.setFloat(5,style.getOldperprice());
			pre.setShort(6, style.getId());
			i=pre.executeUpdate();
			
    	}catch(SQLException e){
  	      System.out.print(e.getMessage());
  	    }finally{
  	    	Conn.release(rs);
  	    	Conn.release(pre);
  	    	Conn.release(conn);
    	}
		return i;
	}
	public int updatetheStyle(Style style) {
		// TODO Auto-generated method stub

		int i=0;
    	String sql="update style set name=?,image=? where id=?";
    	try{
    		conn=(Connection) Conn.getConnection();
    		pre=(PreparedStatement) conn.prepareStatement(sql);
    		//System.out.println(style.getId());
    		pre.setString(1,style.getName());
			pre.setString(2,style.getImage());
			pre.setShort(3, style.getId());
			//System.out.println(pre.getPreparedSql());
			i=pre.executeUpdate();
			
    	}catch(SQLException e){
  	      System.out.print(e.getMessage());
  	    }finally{
  	    	Conn.release(rs);
  	    	Conn.release(pre);
  	    	Conn.release(conn);
    	}
		return i;
	}

	@Override
	public int deleteStyle(Short id) {
		// TODO Auto-generated method stub
		int i=0;
    	String sql="delete from style where id=?";
    	try{
    		conn=(Connection) Conn.getConnection();
    		pre=(PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, id);
			i=pre.executeUpdate();
			
    	}catch(SQLException e){
  	      System.out.print(e.getMessage());
  	    }finally{
  	    	Conn.release(rs);
  	    	Conn.release(pre);
  	    	Conn.release(conn);
    	}
		return i;
	}
	
	public int deleteproStyle(Short pid) {
		// TODO Auto-generated method stub
		int i=0;
    	String sql="delete from style where proid=?";
    	try{
    		conn=(Connection) Conn.getConnection();
    		pre=(PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1, pid);
			i=pre.executeUpdate();
			
    	}catch(SQLException e){
  	      System.out.print(e.getMessage());
  	    }finally{
  	    	Conn.release(rs);
  	    	Conn.release(pre);
  	    	Conn.release(conn);
    	}
		return i;
	}

	@Override
	public Collection<Style> getStyle(String str) {
		// TODO Auto-generated method stub
		Collection<Style> groups=new ArrayList<Style>();
		String sql=str;
		try{
    		conn=(Connection) Conn.getConnection();
    		pre=(PreparedStatement) conn.prepareStatement(sql);
			rs=pre.executeQuery();
			while(rs.next()){
				Style sty=new Style();
				sty.setId(rs.getShort("style.id"));
				sty.setName(rs.getString("style.name"));
				sty.setImage(rs.getString("style.image"));
				sty.setProid(rs.getShort("style.proid"));
				sty.setPerPrice(rs.getFloat("style.perPrice"));
				sty.setOldperprice(rs.getFloat("style.oldperprice"));
				groups.add(sty);										
			}
    	}catch(SQLException e){
  	      System.out.print(e.getMessage());
  	    }finally{
  	    	Conn.release(rs);
  	    	Conn.release(pre);
  	    	Conn.release(conn);
    	}
		return groups;
	}

	@Override
	public Style findStyle(Short id) {
		// TODO Auto-generated method stub
		Style sty=new Style();
    	String sql="select * from style where id=?";
    	try{
    		conn=(Connection) Conn.getConnection();
    		pre=(PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1,id);
			rs=pre.executeQuery();
			if(rs.next()){
				sty.setId(rs.getShort("style.id"));
				sty.setName(rs.getString("style.name"));
				sty.setImage(rs.getString("style.image"));
				sty.setProid(rs.getShort("style.proid"));
				sty.setPerPrice(rs.getFloat("style.perPrice"));
				sty.setOldperprice(rs.getFloat("style.oldperprice"));
			}else{
				sty=null;			
			}
    	}catch(SQLException e){
  	      System.out.print(e.getMessage());
  	    }finally{
  	    	Conn.release(rs);
  	    	Conn.release(pre);
  	    	Conn.release(conn);
    	}
    	return sty;
	}
	public Collection<Style> findStyleByProid(Short proid) {
		// TODO Auto-generated method stub
		Collection<Style> groups=new ArrayList<Style>();
		String sql="select * from style where proid=?";
		try{
    		conn=(Connection) Conn.getConnection();
    		pre=(PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1,proid);
			rs=pre.executeQuery();
			while(rs.next()){
				Style sty=new Style();
				sty.setId(rs.getShort("style.id"));
				sty.setName(rs.getString("style.name"));
				sty.setImage(rs.getString("style.image"));
				sty.setProid(rs.getShort("style.proid"));
				sty.setPerPrice(rs.getFloat("style.perPrice"));
				sty.setOldperprice(rs.getFloat("style.oldperprice"));
				groups.add(sty);										
			}
    	}catch(SQLException e){
  	      System.out.print(e.getMessage());
  	    }finally{
  	    	Conn.release(rs);
  	    	Conn.release(pre);
  	    	Conn.release(conn);
    	}
		return groups;
	}

}
