package com.RoyalStay.hm.dao;

import java.sql.*;


public class LoginValidation {
	//user exist check
public static byte isValid(String username,String password){
	try{ 
		Connection con=MyConnection.getConnection();
		//here fsdtraining is database name, root is username and password  
		PreparedStatement stmt=con.prepareStatement("select * from User where username=? and password=?");
		stmt.setString(1, username);
		stmt.setString(2, password);
		ResultSet rs=stmt.executeQuery();
		if(rs.next()){
			if(rs.getBoolean(7)){
				con.close();
				return 2;
			}else{
				con.close();
				return 1;
			}
		}
		con.close();
		}catch(Exception e){ System.out.println(e);}
	return 0;
}
}