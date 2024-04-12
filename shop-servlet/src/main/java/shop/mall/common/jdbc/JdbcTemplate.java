package shop.mall.common.jdbc;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JdbcTemplate {
	
	public static Connection getConnection(boolean isLocal) {
		Connection conn = null;
		Properties prop = new Properties();
		String currentPath = JdbcTemplate.class.getResource("./").getPath();
		try {
			prop.load(new FileReader(currentPath+"driver.properties"));
			Class.forName(prop.getProperty("jdbc.driver"));
			if(isLocal) {
				conn = DriverManager.getConnection(
						prop.getProperty("jdbc.localhost.url"),
						prop.getProperty("jdbc.localhost.username"),
						prop.getProperty("jdbc.localhost.userpassword"));
			} else {
				conn = DriverManager.getConnection(
						prop.getProperty("jdbc.db.url"),
						prop.getProperty("jdbc.db.username"),
						prop.getProperty("jdbc.db.userpassword"));
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public static void commit(Connection conn) {
		try {
			if(conn!=null)
				conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			if(conn!=null)
				conn.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection conn) {
		try {
			if(conn!=null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(stmt!=null)
				stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			if(rs!=null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
