package com.jdbc;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Driver;
import com.sun.jndi.url.corbaname.corbanameURLContextFactory;

public class JDBCTEST {
	public static void main(String[] args)throws SQLException {
		Driver driver=new com.mysql.jdbc.Driver();
		String url="jdbc:mysql://localhost:3306/yougo";
		Properties info=new Properties();
		info.put("user", "root");
		info.put("password", "123456");
		String username="root";
		String password="123456";
		
		Connection conn=(Connection) driver.connect(url, info);
		System.out.println(conn);
		System.out.println(DriverManager.getConnection(url, info));
	}
}
