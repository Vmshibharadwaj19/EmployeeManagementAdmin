package com.Banking;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
   public static final String url="jdbc:mysql://localhost:3306/bankdb";
   public static final String user="root";
   public static final String pwd="vamshi";

   public static Connection getConnection() throws SQLException,ClassNotFoundException
   {
	   return DriverManager.getConnection(url,user,pwd);
   }

}
