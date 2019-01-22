package com.RoyalStay.hm.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RoyalStay.hm.dao.InsertBooking;

/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DateTimeFormatter formatter=DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		int roomNumber=Integer.parseInt(request.getParameter("roomNumber"));
		String userName=request.getParameter("userName");
		LocalDateTime checkInDate=LocalDateTime.parse(request.getParameter("checkIn"),formatter);
		LocalDateTime checkOutDate=LocalDateTime.parse(request.getParameter("checkOut"),formatter);
		RequestDispatcher rd;
		if(InsertBooking.bookRoom(roomNumber,userName,checkInDate,checkOutDate)){
			request.setAttribute("name",userName);
			request.setAttribute("roomnumber",String.valueOf(roomNumber));
			request.setAttribute("checkin", checkInDate.format(formatter));
			request.setAttribute("checkout", checkOutDate.format(formatter));
			request.setAttribute("booking", "success");
			rd=request.getRequestDispatcher("UserRoomDisplay.jsp");
		}else{
			request.setAttribute("booking", "failed");
			rd=request.getRequestDispatcher("UserRoomDisplay.jsp");
		}
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
