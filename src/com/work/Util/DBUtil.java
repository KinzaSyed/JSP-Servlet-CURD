package com.work.Util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBUtil {

	private static Connection con;
	public static Connection getConnection() {
		
		InputStream is = DBUtil.class.getClassLoader().getResourceAsStream("/db.properties");
		Properties prop = new Properties();
		try {
			prop.load(is);
			String Driver = prop.getProperty("driver");
			String url = prop.getProperty("url");
			String user = prop.getProperty("user");
			String password = prop.getProperty("password");
			
			Class.forName(Driver);
			con = DriverManager.getConnection(url, user, password);

		}
		catch(IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
		return con;
	}
}
