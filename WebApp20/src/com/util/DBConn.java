/*===================
  	DBConn.java
 ====================*/
package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn
{
	private static Connection dbConn;
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException 
	{
		if (dbConn==null)							 //167 학원에서 내 자리 연결 주소~!
		{											 //----
			String url = "jdbc:oracle:thin:@211.238.142.167:1521:xe";
			String user = "scott";
			String pwd = "tiger";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbConn = DriverManager.getConnection(url, user, pwd);
		}
		
		return dbConn;
	}
	
	public static Connection getConnection(String url, String user, String pwd) throws SQLException, ClassNotFoundException 
	{
		if (dbConn==null)
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbConn = DriverManager.getConnection(url, user, pwd);
		}
		
		return dbConn;
	}
	

	public static void close() throws SQLException
	{
		if (dbConn!=null)
		{
			if (!dbConn.isClosed())
				dbConn.close();
		}
		
		dbConn = null;
	}
}