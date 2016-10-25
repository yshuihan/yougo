package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class UserDaoImpl implements UserDao{

	Connection conn = null;
	PreparedStatement pre = null;
	ResultSet rs = null;
	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		int i=0;
    	String sql="insert into user(name,email,password) values(?,?,?)";
    	try{
    		conn=(Connection) Conn.getConnection();
    		pre=(PreparedStatement) conn.prepareStatement(sql);
			pre.setString(1,user.getName());
			pre.setString(2,user.getEmail());
			pre.setString(3,user.getPassword());
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
	
	public int userNum(String sql) {
		// TODO Auto-generated method stub
		int i=0;
    	try{
    		conn=(Connection) Conn.getConnection();
    		pre=(PreparedStatement) conn.prepareStatement(sql);
			rs=pre.executeQuery();
			//i = Integer.parseInt(rs.getFetchSize());
			while(rs.next()){
				i++;
			}
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
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		int i=0;
    	String sql="update user set name=?,email=?,phone=?,QQ=?," +
    			"birthday=?,adress=? where id=?";
    	try{
    		conn=(Connection) Conn.getConnection();
    		pre=(PreparedStatement) conn.prepareStatement(sql);
    		pre.setString(1,user.getName());
			pre.setString(2,user.getEmail());
			pre.setString(3,user.getPhone());
			pre.setString(4,user.getQq());
			String usrbirth = user.getBirthday();
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd") ; 
	        Date dt = null ;    
	        try{    
	            dt = sdf.parse(usrbirth) ;       
	        }catch(Exception e){         
	            e.printStackTrace() ;    
	        }
	        usrbirth = sdf.format(dt);
			pre.setString(5, usrbirth);
			pre.setString(6,user.getAdress());
			pre.setShort(7,user.getId());
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

	public int updateUserPassword(User user) {
		// TODO Auto-generated method stub
		int i=0;
    	String sql="update user set password=? where id=?";
    	try{
    		conn=(Connection) Conn.getConnection();
    		pre=(PreparedStatement) conn.prepareStatement(sql);
    		pre.setString(1,user.getPassword());
			pre.setShort(2,user.getId());
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
	public int updateUserHeadImage(User user) {
		// TODO Auto-generated method stub
		int i=0;
    	String sql="update user set headimage=? where id=?";
    	try{
    		conn=(Connection) Conn.getConnection();
    		pre=(PreparedStatement) conn.prepareStatement(sql);
    		pre.setString(1,user.getHeadimage());
			pre.setShort(2,user.getId());
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
	public int deleteUser(Short id) {
		// TODO Auto-generated method stub
		int i=0;
    	String sql="delete from user where id=?";
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

	@Override
	public Collection<User> getUser(String str) {
		// TODO Auto-generated method stub
		Collection<User> groups=new ArrayList<User>();
		String sql=str;
		try{
    		conn=(Connection) Conn.getConnection();
    		pre=(PreparedStatement) conn.prepareStatement(sql);
			rs=pre.executeQuery();
			while(rs.next()){
				User usr=new User();
				usr.setId(rs.getShort("user.id"));
				usr.setName(rs.getString("user.name"));
				usr.setEmail(rs.getString("user.email"));
				usr.setPassword(rs.getString("user.password"));
				usr.setHeadimage(rs.getString("user.headimage"));
				usr.setPhone(rs.getString("user.phone"));
				usr.setQq(rs.getString("user.qq"));
				usr.setBirthday(rs.getString("user.birthday"));
				usr.setAdress(rs.getString("user.adress"));
				usr.setLevel(rs.getShort("user.level"));
				groups.add(usr);										
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
	public User findUser(Short id) {
		// TODO Auto-generated method stub
		User usr=new User();
    	String sql="select * from user where id=?";
    	try{
    		conn=(Connection) Conn.getConnection();
    		pre=(PreparedStatement) conn.prepareStatement(sql);
			pre.setShort(1,id);
			rs=pre.executeQuery();
			if(rs.next()){
				usr.setId(rs.getShort("user.id"));
				usr.setName(rs.getString("user.name"));
				usr.setEmail(rs.getString("user.email"));
				usr.setPassword(rs.getString("user.password"));
				usr.setHeadimage(rs.getString("user.headimage"));
				usr.setPhone(rs.getString("user.phone"));
				usr.setQq(rs.getString("user.qq"));
				usr.setBirthday(rs.getString("user.birthday"));
				usr.setAdress(rs.getString("user.adress"));
				usr.setLevel(rs.getShort("user.level"));
			}else{
				usr=null;			
			}
    	}catch(SQLException e){
  	      System.out.print(e.getMessage());
  	    }finally{
  	    	Conn.release(rs);
  	    	Conn.release(pre);
  	    	Conn.release(conn);
    	}
    	return usr;
	}
	public User isUser(String str) {
		// TODO Auto-generated method stub
		User usr=new User();
    	String sql=str;
    	try{
    		conn=(Connection) Conn.getConnection();
    		pre=(PreparedStatement) conn.prepareStatement(sql);
			rs=pre.executeQuery();
			if(rs.next()){
				usr.setId(rs.getShort("user.id"));
				usr.setName(rs.getString("user.name"));
				usr.setEmail(rs.getString("user.email"));
				usr.setPassword(rs.getString("user.password"));
				usr.setHeadimage(rs.getString("user.headimage"));
				usr.setPhone(rs.getString("user.phone"));
				usr.setQq(rs.getString("user.qq"));
				usr.setBirthday(rs.getString("user.birthday"));
				usr.setAdress(rs.getString("user.adress"));
				usr.setLevel(rs.getShort("user.level"));
			}else{
				usr=null;			
			}
    	}catch(SQLException e){
  	      System.out.print(e.getMessage());
  	    }finally{
  	    	Conn.release(rs);
  	    	Conn.release(pre);
  	    	Conn.release(conn);
    	}
    	return usr;
	}

}
