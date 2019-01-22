package com.RoyalStay.hm.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.RoyalStay.hm.dao.Registration;
import com.RoyalStay.hm.pojo.CustomerPojo;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
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
		String name=request.getParameter("name");
		String username=request.getParameter("username");
		String password=request.getParameter("psw");
		String contact=request.getParameter("contact");
		String document=request.getParameter("document");
		HttpSession session=request.getSession();
		session.setMaxInactiveInterval(90);
		session.setAttribute("username", username);
		
		CustomerPojo customerPojo=new CustomerPojo();
		customerPojo.setName(name);
		customerPojo.setContactNumber(contact);
		customerPojo.setUserName(username);
		customerPojo.setDocumentType(document);
		customerPojo.setPassword(password);
		customerPojo.setStatus(false);
		RequestDispatcher rd=null;
		if(Registration.doRegister(customerPojo)){
			request.setAttribute("name", username);
			request.setAttribute("msg", "");
			request.setAttribute("value", "user");
			rd=request.getRequestDispatcher("UserRoomDisplay.jsp");
		}else{
			rd=request.getRequestDispatcher("RegistrationPage.html");
		}
		rd.forward(request, response);
		//doGet(request, response);
	}

}
