package com.RoyalStay.hm.pojo;

import java.time.LocalDateTime;

public class BookingPojo 
{
	private String bookingId;
	private String customerName;
	private LocalDateTime bookingDate;
	private LocalDateTime checkInDate;
	private LocalDateTime checkOutDate;
	
	public String getBookingId()
	{
		return bookingId;
	}
	public void setBookingId(String bookingId)
	{
		this.bookingId = bookingId;
	}
	public LocalDateTime getBookingDate() 
	{
		return bookingDate;
	}
	public void setBookingDate(LocalDateTime bookingDate) 
	{
		this.bookingDate = bookingDate;
	}
	public LocalDateTime getCheckInDate() 
	{
		return checkInDate;
	}
	public void setCheckInDate(LocalDateTime checkInDate)
	{
		this.checkInDate = checkInDate;
	}
	public LocalDateTime getCheckOutDate()
	{
		return checkOutDate;
	}
	public void setCheckOutDate(LocalDateTime checkOutDate) 
	{
		this.checkOutDate = checkOutDate;
	}
	
	public String getCustomerName()
	{
		return customerName;
	}
	public void setCustomerName(String customerName)
	{
		this.customerName = customerName;
	}
}

