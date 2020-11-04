package projectFiles;

import static projectFiles.Provider.*;

import java.sql.*;  
  
public class ConnectionProvider {  
private static Connection con=null;  
static{  	
try{  
Class.forName(DRIVER);  
con=DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);  


}catch(Exception e){
	System.out.println("error");
}  
}  
  
public static Connection getCon(){  
    return con;  
}  
  
}  