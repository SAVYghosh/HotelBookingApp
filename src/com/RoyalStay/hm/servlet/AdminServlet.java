package com.RoyalStay.hm.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.RoyalStay.hm.dao.BookingInformation;
import com.RoyalStay.hm.dao.CustomerInformation;
import com.RoyalStay.hm.dao.RoomInformation;
import com.RoyalStay.hm.pojo.CustomerPojo;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
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
		//rd.forward(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd;
		String requestType=(String)request.getParameter("submit");
		if(requestType.equals("Search Customer")){
			String customerDetail=request.getParameter("customerDetail");
			ArrayList<CustomerPojo> customerList=CustomerInformation.getCustomerDetails(customerDetail);
			request.setAttribute("customerList", customerList);
			request.setAttribute("roomList", RoomInformation.getRoomList());
			request.setAttribute("bookingList", BookingInformation.getBookingsList());
		}
		if(requestType.equals("Add room")){
			int roomnumber=Integer.parseInt(request.getParameter("roomnumber"));
			String roomtype=request.getParameter("roomtype");
			
			int i=RoomInformation.insertRoom(roomnumber, roomtype);
			if(i==0)
				request.setAttribute("msg", "not updated");
			else if(i==404)
				request.setAttribute("msg", "Room exists");
			else
				request.setAttribute("msg", i+" record updated");
			request.setAttribute("roomList", RoomInformation.getRoomList());
			request.setAttribute("customerList", CustomerInformation.getCustomerDetails());
			request.setAttribute("bookingList", BookingInformation.getBookingsList());
		}
		if(requestType.equals("Modify Room")){
			int roomNumberList[]=new int[RoomInformation.getRoomList().size()];
			String roomTypeList[]=new String[RoomInformation.getRoomList().size()];
			for(int i=1;i<=RoomInformation.getRoomList().size();i++){
				roomTypeList[i-1]=request.getParameter("roomtype"+i);
				roomNumberList[i-1]=Integer.parseInt(request.getParameter("roomnumber"+i));
				System.out.println(request.getParameter("roomtype"+i));
				System.out.println(request.getParameter("roomnumber"+i));
			}
			int i=RoomInformation.updateRoom(roomNumberList,roomTypeList).length;
			request.setAttribute("roomList", RoomInformation.getRoomList());
			request.setAttribute("customerList", CustomerInformation.getCustomerDetails());
			request.setAttribute("bookingList", BookingInformation.getBookingsList());
		}
		request.setAttribute("username", "user");
		rd=request.getRequestDispatcher("AdminDisplayPage.jsp");
		rd.forward(request, response);
		//doGet(request, response);
	}

}
