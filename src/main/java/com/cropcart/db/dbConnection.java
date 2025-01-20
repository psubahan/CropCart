package com.cropcart.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbConnection 
{
    static String url = "jdbc:mysql://localhost:3306/agriculture";
	
	static String username = "root";
	static String password = "tiger";
	static Connection conn = null;

	public static Connection getConnection() {

		if (conn == null) 
		{
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url, username, password);
			} catch (ClassNotFoundException | SQLException e) 
			{
				e.printStackTrace();
			}
		}
		return conn;
	}
}
