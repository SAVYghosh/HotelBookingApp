package com.RoyalStay.hm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;

import com.RoyalStay.hm.pojo.BookingPojo;
import com.RoyalStay.hm.pojo.RoomPojo;

public class BookingInformation {
	ArrayList<RoomPojo> roomList=new ArrayList<RoomPojo>();
	public ArrayList<RoomPojo> getRoomInformation(String roomtype,LocalDateTime checkinDate,LocalDateTime checkoutDate){
		try{ 
			Connection con=MyConnection.getConnection();
			PreparedStatement stmt;
			if(roomtype.equals("All"))
				stmt=con.prepareStatement("select roomnumber,type,checkin,checkout from Room left Join Bookings on room_number=roomnumber order by roomnumber desc,checkin desc;");
			else{
				stmt=con.prepareStatement("select roomnumber,type,checkin,checkout from Room left Join Bookings on room_number=roomnumber where type=? order by roomnumber desc,checkin desc;");
				stmt.setString(1, roomtype);
			}
			ResultSet rs=stmt.executeQuery();
			int flag=0;
			RoomPojo roomPojo;
			RoomPojo currentRoomPojo=null;
			RoomPojo prevRoomPojo=null;
			int roomNumber=0;
			while(rs.next()){
				if(roomNumber==rs.getInt(1))
					continue;
				if(prevRoomPojo==null){
					currentRoomPojo=new RoomPojo();
					currentRoomPojo.setRoomNumber(rs.getInt(1));
					currentRoomPojo.setRoomType(rs.getString(2));
					prevRoomPojo=currentRoomPojo;
				}else{
					prevRoomPojo=currentRoomPojo;
					currentRoomPojo=new RoomPojo();
					currentRoomPojo.setRoomNumber(rs.getInt(1));
					currentRoomPojo.setRoomType(rs.getString(2));
				}
				
				if(prevRoomPojo.getRoomNumber()!=currentRoomPojo.getRoomNumber()&&flag==1){
					roomPojo=new RoomPojo();
					roomPojo.setRoomNumber(prevRoomPojo.getRoomNumber());
					roomPojo.setRoomType(prevRoomPojo.getRoomType());
					roomList.add(roomPojo);
					flag=0;
					
				}
				if(rs.getDate(3)!=null&&rs.getDate(4)!=null&&checkoutDate.toLocalDate().isAfter(rs.getDate(3).toLocalDate())&&checkoutDate.toLocalDate().isBefore(rs.getDate(4).toLocalDate())){
					roomNumber=rs.getInt(1);
					continue;
				}
				else{
					if(rs.getDate(4)!=null&&checkinDate.toLocalDate().isBefore(rs.getDate(4).toLocalDate())){
						roomNumber=rs.getInt(1);
						continue;
					}
					else{
						flag=1;
					}
				}
			}
			if(flag==1){
				roomList.add(currentRoomPojo);
			}
			
			con.close();
			}catch(Exception e){ System.out.println(e);}
		return roomList;
	}
	public static ArrayList<BookingPojo> getBookingsList(){
		ArrayList<BookingPojo> bookingList=new ArrayList<BookingPojo>();
		try{
			BookingPojo bookingPojo;
			Connection con=MyConnection.getConnection();
			//here fsdtraining is database name, root is username and password  
			PreparedStatement stmt=con.prepareStatement("select b.id,a.name,b.date,b.checkin,b.checkout from User a inner join Bookings b where a.username=b.user_name;");
			
			ResultSet rs=stmt.executeQuery();
			while(rs.next()){
				bookingPojo=new BookingPojo();
				bookingPojo.setBookingId(rs.getString(1));
				bookingPojo.setCustomerName(rs.getString(2));
				bookingPojo.setBookingDate(rs.getTimestamp(3).toLocalDateTime());
				bookingPojo.setCheckInDate(rs.getTimestamp(4).toLocalDateTime());
				bookingPojo.setCheckOutDate(rs.getTimestamp(5).toLocalDateTime());
				bookingList.add(bookingPojo);
			}
			
			con.close();			
			}catch(Exception e){ System.out.println(e);}
		return bookingList;
	}
}
