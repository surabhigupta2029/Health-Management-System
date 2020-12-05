package projectFiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;

/**
 * Class: DBManager.java
 * Purpose: Creates database connection that will be used to other servlet classes
 * to make calls to either get or post from the database. 
 */

public class DBManager {
	public Connection CONN = null;
	public Statement stmt = null;

	public DBManager() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			CONN = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/hUxI8wceQb?autoReconnect=true", "hUxI8wceQb",
					"Bkf4lluIon");
			stmt = CONN.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			// DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "user",
			// "pass");
			Connection conn = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/hUxI8wceQb?autoReconnect=true", "hUxI8wceQb",
					"Bkf4lluIon");

			return conn;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

} // end of class
