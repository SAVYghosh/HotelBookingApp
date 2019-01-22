package com.RoyalStay.hm.dao;

import java.sql.*;
import java.util.Random;

import com.RoyalStay.hm.pojo.CustomerPojo;

public class Registration {
	public static boolean doRegister(CustomerPojo customerPojo){
		int i=0;
		Random random=new Random();
		try{ 
			Connection con=MyConnection.getConnection();
			//here fsdtraining is database name, root is username and password  
			PreparedStatement stmt=con.prepareStatement("insert into User values(?,?,?,?,?,?,?)");
			stmt.setInt(1,Math.abs(random.nextInt(1000)));
			stmt.setString(2,customerPojo.getUserName());
			stmt.setString(3,customerPojo.getPassword());
			stmt.setString(4,customerPojo.getName());
			stmt.setString(5,customerPojo.getContactNumber());
			stmt.setString(6,customerPojo.getDocumentType());
			stmt.setBoolean(7, customerPojo.getStatus());
			i=stmt.executeUpdate();
			
			con.close();			
			}catch(Exception e){ System.out.println(e);}
		if(i==0)
			return false;
		else
			return true;
	}
}