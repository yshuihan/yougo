package com.yougo.test;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Driver;
import com.sun.jndi.url.corbaname.corbanameURLContextFactory;
import com.yougo.db.Conn;

/**
 * 
 * @author Alpha
 * 
 */
public class JDBCTEST {
	public static void main(String[] args) throws SQLException {
		
		Connection connect= (Connection) Conn.getConnection();

		System.out.println(connect);
	}
}
