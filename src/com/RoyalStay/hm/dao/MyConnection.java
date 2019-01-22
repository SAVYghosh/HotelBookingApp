package com.RoyalStay.hm.dao;
import java.sql.*;

public class MyConnection {
public static Connection getConnection() throws SQLException, ClassNotFoundException{
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:mysql://localhost:3306/fsdtraining","root","root"); 
	return con;
}
}
