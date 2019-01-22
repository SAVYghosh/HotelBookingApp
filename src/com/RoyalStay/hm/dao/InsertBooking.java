package com.RoyalStay.hm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

public class InsertBooking {
	public static boolean bookRoom(int roomNumber,String userName,LocalDateTime checkindate,LocalDateTime checkoutdate){
		int i=0;
		Random random=new Random();
		try{ 
			Connection con=MyConnection.getConnection();
			DateTimeFormatter formatter=DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			//here fsdtraining is database name, root is username and password  
			PreparedStatement stmt=con.prepareStatement("insert into Bookings values(?,?,?,?,?,?)");
			stmt.setInt(1,Math.abs(random.nextInt(1000)));
			stmt.setString(2,userName);
			stmt.setInt(3,roomNumber);
			stmt.setDate(4,java.sql.Date.valueOf(LocalDateTime.now().toLocalDate()));
			stmt.setDate(5,java.sql.Date.valueOf(checkindate.toLocalDate()));
			stmt.setDate(6,java.sql.Date.valueOf(checkoutdate.toLocalDate()));
			i=stmt.executeUpdate();
			
			con.close();			
			}catch(Exception e){ System.out.println(e);}
		if(i==0)
			return false;
		else
			return true;
	}
}
