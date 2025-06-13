package com.NewBank.Servlet;

import java.io.IOException;

import com.NewBank.DAO.CustomerDAO;
import com.NewBank.DAO.CustomerDAOimpl;
import com.NewBank.dto.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class DeleteAccount extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		CustomerDAO cdao=new CustomerDAOimpl();
		Customer c=new Customer();
		c.setACC_NO(Long.parseLong(req.getParameter("id")));
		if(cdao.deleteCustomer(c)) {
			session.setAttribute("delete_success", "Deleted Successfully!");
			RequestDispatcher rd=req.getRequestDispatcher("Customerdetails.jsp");
			rd.forward(req, resp);
		}
		else {
			session.setAttribute("delete_fail", "Failed to Delete!, Try again!");
			RequestDispatcher rd=req.getRequestDispatcher("Customerdetails.jsp");
			rd.forward(req, resp);
		}
	}
}
