package com.RoyalStay.hm.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.RoyalStay.hm.dao.BookingInformation;
import com.RoyalStay.hm.pojo.RoomPojo;

/**
 * Servlet implementation class AvailablilityServlet
 */
@WebServlet("/AvailabilityServlet")
public class AvailabilityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AvailabilityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		session.removeAttribute("username");
		session.invalidate();
		response.sendRedirect("Homepage.jsp");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DateTimeFormatter formatter=DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String roomtype=request.getParameter("roomtype");
		LocalDateTime checkinDate=LocalDateTime.parse(request.getParameter("checkindate")+" 00:00:00", formatter);
		LocalDateTime checkoutDate=LocalDateTime.parse(request.getParameter("checkoutdate")+" 00:00:00", formatter);
		
		if(request.getParameter("msg").equals("null")&&request.getParameter("name").equals("null")){
			request.setAttribute("name", null);
			HttpSession session=request.getSession();
			session.setMaxInactiveInterval(90);
			session.setAttribute("username", "userno");
		}
		else{
			request.setAttribute("name", request.getParameter("name"));
			request.setAttribute("checkin", request.getParameter("checkindate")+" 00:00:00");
			request.setAttribute("checkout", request.getParameter("checkoutdate")+" 00:00:00");
		}
		RequestDispatcher rd=request.getRequestDispatcher("UserRoomDisplay.jsp");
		//RequestDispatcher rd=request.getRequestDispatcher("RoomDisplay.jsp");
		BookingInformation obj=new BookingInformation();
		ArrayList<RoomPojo> roomlist;
		
		
		roomlist=obj.getRoomInformation(roomtype,checkinDate,checkoutDate);
		request.setAttribute("roomlist", roomlist);
		request.setAttribute("msg", "search");
		rd.forward(request, response);
		//doGet(request, response);
	}

}
