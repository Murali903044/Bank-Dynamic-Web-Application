package com.NewBank.Servlet;

import java.io.IOException;

import com.NewBank.DAO.CustomerDAOimpl;
import com.NewBank.dto.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class Register extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		//		Customer c=(Customer)session.getAttribute("customer");
		CustomerDAOimpl cdao=new CustomerDAOimpl();
		Customer c=new Customer();
		c.setName(req.getParameter("fullname"));
		c.setPhone(Long.parseLong(req.getParameter("phone")));
		c.setMail(req.getParameter("mail"));

		if(req.getParameter("password").equals(req.getParameter("conpassword"))){
			c.setPin(Integer.parseInt(req.getParameter("conpassword")));

			if(cdao.insertCustomer(c)) {
				req.setAttribute("Success", "Registered  successfully!");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			}
			else {
				req.setAttribute("faliure", "Falied to Register");
				RequestDispatcher rd=req.getRequestDispatcher("Register1.jsp");
				rd.forward(req, resp);
			}
		}
		{
			req.setAttribute("error", "Password Mismatch");
			RequestDispatcher rd=req.getRequestDispatcher("Register1.jsp");
			rd.forward(req, resp);

		}
	}
}

