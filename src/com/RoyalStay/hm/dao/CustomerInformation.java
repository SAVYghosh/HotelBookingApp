package com.RoyalStay.hm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.RoyalStay.hm.pojo.CustomerPojo;

public class CustomerInformation {
	public static ArrayList<CustomerPojo> getCustomerDetails(){
		ArrayList<CustomerPojo> customerlist=new ArrayList<CustomerPojo>();
		CustomerPojo customerPojo;
		try{ 
			Connection con=MyConnection.getConnection();  
			PreparedStatement stmt=con.prepareStatement("select * from User where status=?");
			stmt.setBoolean(1, false);
			ResultSet rs=stmt.executeQuery();
			
			while(rs.next()){
				customerPojo=new CustomerPojo();
				customerPojo.setUserName(rs.getString(2));
				customerPojo.setPassword(rs.getString(3));
				customerPojo.setName(rs.getString(4));
				customerPojo.setContactNumber(rs.getString(5));
				customerPojo.setDocumentType(rs.getString(6));
				customerlist.add(customerPojo);
			}
			con.close();			
			}catch(Exception e){ System.out.println(e);}
		return customerlist;
	}
	public static ArrayList<CustomerPojo> getCustomerDetails(String customerDetail){
		ArrayList<CustomerPojo> customerlist=new ArrayList<CustomerPojo>();
		CustomerPojo customerPojo;
		try{
			Connection con=MyConnection.getConnection();
			PreparedStatement stmt=con.prepareStatement("select * from User where name=? or contact=? and status=0");
			stmt.setString(1, customerDetail);
			stmt.setString(2, customerDetail);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()){
				customerPojo=new CustomerPojo();
				customerPojo.setUserName(rs.getString(2));
				customerPojo.setPassword(rs.getString(3));
				customerPojo.setName(rs.getString(4));
				customerPojo.setContactNumber(rs.getString(5));
				customerPojo.setDocumentType(rs.getString(6));
				customerlist.add(customerPojo);
			}
			con.close();			
			}catch(Exception e){ System.out.println(e);}
		return customerlist;
	}
}