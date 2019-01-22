package com.RoyalStay.hm.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.RoyalStay.hm.dao.BookingInformation;
import com.RoyalStay.hm.dao.CustomerInformation;
import com.RoyalStay.hm.dao.LoginValidation;
import com.RoyalStay.hm.dao.RoomInformation;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("uname");
		String password=request.getParameter("pass");
		byte check;
		RequestDispatcher rd=null;
		if((check=LoginValidation.isValid(username,password))!=0){
			HttpSession session=request.getSession();
			session.setMaxInactiveInterval(90);
			session.setAttribute("username", username);
			//for customers
			if(check==1){
				request.setAttribute("msg", "");
				request.setAttribute("name", username);
				rd=request.getRequestDispatcher("UserRoomDisplay.jsp");
				//response.sendRedirect("UserRoomDisplay.jsp");
				//rd=request.getRequestDispatcher("RoomDisplay.jsp");
			}
			else{
				request.setAttribute("roomList", RoomInformation.getRoomList());
				request.setAttribute("customerList", CustomerInformation.getCustomerDetails());
				request.setAttribute("bookingList", BookingInformation.getBookingsList());
				rd=request.getRequestDispatcher("AdminDisplayPage.jsp");
			}
		}else{
			request.setAttribute("msg", "Wrong username/password");
			rd=request.getRequestDispatcher("LoginPage.html");
		}
		rd.forward(request, response);
		//doGet(request, response);
	}

}
