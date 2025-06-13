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
@WebServlet("/reset")
public class Reset extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false); // Don't create new session

		Customer s1 = (Customer) session.getAttribute("customer");
		CustomerDAO cdao = new CustomerDAOimpl();

		// Validate phone and email
		long phone = Long.parseLong(req.getParameter("number"));
		String mail = req.getParameter("mail");

		if (phone == s1.getPhone() && mail.equals(s1.getMail())) {
			// Only update if passwords match
			if (req.getParameter("password").equals(req.getParameter("cpassword"))) {
				s1.setPin(Integer.parseInt(req.getParameter("password")));
				if (cdao.updateCustomer(s1)) {
					req.setAttribute("success", "Password Changed Successfully!");
					req.getRequestDispatcher("Customerpage.jsp").forward(req, resp);
				} else {
					req.setAttribute("error2", "Failed to update account.");
					req.getRequestDispatcher("reset.jsp").forward(req, resp);
				}
			} else {
				req.setAttribute("error4", "Passwords do not match.");
				req.getRequestDispatcher("reset.jsp").forward(req, resp);
			}
		} else {
			req.setAttribute("error3", "Phone or Email doesn't match our records.");
			req.getRequestDispatcher("reset.jsp").forward(req, resp);
		}
	}
}
