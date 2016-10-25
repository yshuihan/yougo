package com.jdbc;
import java.sql.*;
public class Conn {
	public static Connection getConnection(){
		Connection con=null;	
		String drive = "com.mysql.jdbc.Driver";	
		String url = "jdbc:mysql://5719a03267350.sh.cdb.myqcloud.com:7836/yougo?useUnicode=true&amp;characterEncoding=UTF-8";    
		String username="cdb_outerroot";
		String password="hongze@19930903";
		/*String url = "jdbc:mysql://localhost:3306/yougo?useUnicode=true&amp;characterEncoding=UTF-8";    
		String username="root";
		String password="123456";*/
		try{
			Class.forName(drive);
			con = DriverManager.getConnection(url,username,password);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return con;
	}
	public static void release(Connection conn){
		      if(conn!=null)
		      try{
				conn.close();
			   }catch(SQLException e){
				e.printStackTrace();
			   }
	}	
	public static void release(PreparedStatement pstmt){		
	  if(pstmt!=null)
	  try{
	  pstmt.close();
	  }catch(SQLException e){
			e.printStackTrace();
		}	  
   }   
   public static void release(ResultSet rs){		
		 if(rs!=null)
		 try{
		 rs.close();
		 }catch(SQLException e){
			   e.printStackTrace();
		   }
   }
}
