package projectFiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;

public class DBManager {

	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			// Connection conn =
			// DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "user",
			// "pass");
			Connection conn = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/hUxI8wceQb", "hUxI8wceQb",
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

	// Admin task to create a table
	public void createTable(String sql, regMember member) {
		Statement stmt = null;
		Connection c = null;
		c = getConnection();
		
		try {
			stmt = c.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		executeSQL(stmt, sql);

/*
		sql = "CREATE TABLE REGISTRATION " +
                "(id INTEGER not NULL, " +
                " first VARCHAR(255), " + 
                " last VARCHAR(255), " + 
                " age INTEGER, " + 
                " PRIMARY KEY ( id ))"; 

		executeSQL(stmt, sql);
		
				System.out.println("Created Table\n\n\n\n");

		//test put something in the table
		sql = "INSERT INTO REGISTRATION " +
                "VALUES (200, 'Sam', 'G', 16)";
		executeSQL(stmt, sql);
		System.out.println("Insert Entry in Table\n\n\n\n");

 */
		String resInsert = insert(member);
		executeSQL(stmt, resInsert);

		//fetch that entry from the table
		//sql = "SELECT id, first, last, age FROM REGISTRATION";
//		String strsql = "SELECT id, first, last, address, username, password, contact FROM REGISTRATIONTWO";
//		ResultSet rs = executeSQLResult(stmt, strsql);
	    
		//System.out.println("Fetch Entry in Table\n\n\n\n");

		//print each record
	    //STEP 5: Extract data from result set
//	    try {
//	    	while(rs.next()){
//	         //Retrieve by column name
//	         int id  = rs.getInt("id");
//	         int age = rs.getInt("age");
//	         String first = rs.getString("first");
//	         String last = rs.getString("last");
//	         String username = rs.getString("username");
//	         String password = rs.getString("password");
//	         String address = rs.getString("address");
//	         String contact = rs.getString("contact");
//
//	         //Display values
//	         System.out.print("ID: " + id);
//	         System.out.print(", Age: " + age);
//	         System.out.print(", First: " + first);
//	         System.out.println(", username: " + username);
//	         System.out.println(", password: " + password);
//	         System.out.println(", address: " + address);
//	         System.out.println(", contact: " + contact);
//
//	      }
//	      rs.close();
//	   }catch(SQLException se){
//	      //Handle errors for JDBC
//	      se.printStackTrace();
//	   }catch(Exception e){
//	      //Handle errors for Class.forName
//	      e.printStackTrace();
//	   }
	   
	    try {
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void print() {
		Statement stmt = null;
		Connection c = null;
		c = getConnection();
		
		try {
			stmt = c.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String strsql = "SELECT id, first, last, address, username, password, contact FROM REGISTRATIONTWO";
		ResultSet rs = executeSQLResult(stmt, strsql);
	    
		System.out.println("Fetch Entry in Table\n\n\n\n");

		//print each record
	    //STEP 5: Extract data from result set
	    try {
	    	while(rs.next()){
	         //Retrieve by column name
	         int id  = rs.getInt("id");
	         int age = rs.getInt("age");
	         String first = rs.getString("first");
	         String last = rs.getString("last");
	         String username = rs.getString("username");
	         String password = rs.getString("password");
	         String address = rs.getString("address");
	         String contact = rs.getString("contact");

	         //Display values
	         System.out.print("ID: " + id);
	         System.out.print(", Age: " + age);
	         System.out.print(", First: " + first);
	         System.out.println(", username: " + username);
	         System.out.println(", password: " + password);
	         System.out.println(", address: " + address);
	         System.out.println(", contact: " + contact);

	      }
	      rs.close();
	   }catch(SQLException se){
	      //Handle errors for JDBC
	      se.printStackTrace();
	   }catch(Exception e){
	      //Handle errors for Class.forName
	      e.printStackTrace();
	   }
	   
	    
	    try {
			c.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//execute sql calls where no return data is required
	public void executeSQL(Statement stmt, String sql) {
		try {
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//execute sql calls where no return data is required
	public ResultSet executeSQLResult(Statement stmt, String sql) {
		try {
			return stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
public String insert(regMember member) {
	String sql = "";
	String first = member.getFirstName();
	String last = member.getLastName();
	String username = member.getUsername();
	String password = member.getPassword();
	String address = member.getAddress();
	String contact = member.getContact();
	
	sql = "INSERT INTO REGISTRATION " +
            "VALUES (" + first+"," + last + "," + username + "," + password + "," + address + "," + contact+ ")";
	return sql;
}
//	public String insert(regMember member) {
//		Connection con = getConnection();
//		String result = "yeees";
//		String sql = "INSERT INTO REGISTRATIONTWO VALUES(?,?,?,?,?,?)";
//		try {
//			PreparedStatement ps = con.prepareStatement(sql);
//			ps.setString(1, member.getFirstName());
//			ps.setString(2, member.getLastName());
//			ps.setString(3, member.getUsername());
//			ps.setString(4, member.getPassword());
//			ps.setString(5, member.getAddress());
//			ps.setString(6, member.getContact());
//			ps.executeUpdate();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//
//		}
//
//		return result;
//	}
} // end of class
