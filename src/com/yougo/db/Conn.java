package com.yougo.db;

import java.sql.*;

public class Conn {

    public static Connection getConnection(){
		Connection con=null;	
		String drive = "com.mysql.jdbc.Driver";	
		String url = "jdbc:mysql://123.206.194.233:3306/yougo" +
	            "?useUnicode=true&characterEncoding=UTF-8";
		String username="gyq";
		String password="gyq123456";
		try{
			Class.forName(drive);
			con = DriverManager.getConnection(url,username,password);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return con;
	}
    
	public static void release(Connection conn) {
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	public static void release(PreparedStatement pstmt) {
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	public static void release(ResultSet rs) {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
}
