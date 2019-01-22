package com.RoyalStay.hm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Random;

import com.RoyalStay.hm.pojo.RoomPojo;
import java.sql.ResultSet;

public class RoomInformation {
	public static ArrayList<RoomPojo> getRoomList(){
		ArrayList<RoomPojo> roomlist=new ArrayList<RoomPojo>();
		RoomPojo roomPojo;
		try{ 
			Connection con=MyConnection.getConnection();  
			PreparedStatement stmt=con.prepareStatement("select * from Room");
			ResultSet rs=stmt.executeQuery();
			
			while(rs.next()){
				roomPojo=new RoomPojo();
				roomPojo.setRoomNumber(rs.getInt(2));
				roomPojo.setRoomType(rs.getString(3));
				roomlist.add(roomPojo);
			}
			con.close();			
			}catch(Exception e){ System.out.println(e);}
		return roomlist;
	}
	public static int insertRoom(int roomnumber,String roomtype){
		int rs=0;
		Random random=new Random();
		try{ 
			Connection con=MyConnection.getConnection();  
			PreparedStatement stmt=con.prepareStatement("insert into Room(id,roomnumber,type) values(?,?,?)");
			stmt.setInt(1,Math.abs(random.nextInt(1000)));
			stmt.setInt(2, roomnumber);
			stmt.setString(3, roomtype);
			rs=stmt.executeUpdate();
			
			con.close();			
			}catch(Exception e){ return 404;}
		return rs;
	}
	public static int[] updateRoom(int roomNumberList[],String roomTypeList[]){
		int[] j={0};
		try{
			PreparedStatement stmt = null;
			Connection con=MyConnection.getConnection();
			con.setAutoCommit(false);
			stmt=con.prepareStatement("update Room set roomnumber=?,type=? where roomnumber=?");
			
			for(int i=0;i<roomNumberList.length;i++){
			stmt.setInt(1, roomNumberList[i]);
			stmt.setString(2, roomTypeList[i]);
			stmt.setInt(3, roomNumberList[i]);
			stmt.addBatch();
			}
			j=stmt.executeBatch();
			
			con.commit();
			con.close();
			}catch(Exception e){ }
		return j;
	}
}
