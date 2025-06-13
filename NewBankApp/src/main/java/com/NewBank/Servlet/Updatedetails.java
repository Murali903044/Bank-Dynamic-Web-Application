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


@WebServlet("/update")
public class Updatedetails extends HttpServlet  {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		CustomerDAO cdao=new CustomerDAOimpl();
		Customer c1=(Customer)session.getAttribute("customer");

		c1.setName(req.getParameter("name"));
		c1.setPhone(Long.parseLong(req.getParameter("phone")));
		c1.setMail(req.getParameter("mail"));

		if(cdao.updateCustomer(c1)) {
			req.setAttribute("success", "Your Account has been Update Successfully!");
			RequestDispatcher rd=req.getRequestDispatcher("Customerpage.jsp");
			rd.forward(req, resp);
		}
		else {
			req.setAttribute("fail", "falied to Update!");
			RequestDispatcher rd=req.getRequestDispatcher("updatedetails.jsp");
			rd.forward(req, resp);
		}
	}
}
