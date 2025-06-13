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

@WebServlet("/forgot")
public class Forgot extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//		 CustomerDAO cdao = new CustomerDAOimpl();
		//	        HttpSession session = req.getSession();
		//	        try {
		//	            // Fetch input values
		//	            long phone = Long.parseLong(req.getParameter("phone"));
		//	            String email = req.getParameter("mail");
		//	            String newPassword = req.getParameter("password");
		//	            String confirmPassword = req.getParameter("cpassword");
		//	            
		//
		//	            Customer s=new Customer();
		//	            if (s != null) {
		//	                if (newPassword.equals(confirmPassword)) {
		//	                    // Update password in object
		//	                    s.setPin(Integer.parseInt(confirmPassword));
		//
		//	                    // Save updated student details
		//	    	            Customer s1=cdao.getCustomer(phone, email);
		//
		//	                    if (s1==null) {
		//	                        req.setAttribute("Success", "Password successfully updated");
		//	                        RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
		//	                        rd.forward(req, resp);
		//	                    } else {
		//	                        req.setAttribute("fail", "Failed to update password");
		//	                        RequestDispatcher rd=req.getRequestDispatcher("forgot.jsp");
		//	                        rd.forward(req, resp);
		//	                    }
		//	                } else {
		//	                    req.setAttribute("fail1", "Passwords do not match");
		//	                    RequestDispatcher rd=req.getRequestDispatcher("forgot.jsp");
		//	                    rd.forward(req, resp);
		//	                }
		//	            } else {
		//	                req.setAttribute("error2", "User not found");
		//	                RequestDispatcher rd=req.getRequestDispatcher("forgot.jsp");
		//	                rd.forward(req, resp);
		//	            }
		//	        } catch (Exception e) {
		//	            req.setAttribute("error", "An error occurred: " + e.getMessage());
		//	        }

		// Redirect back to forgotpassword.jsp to display messages
		//	        resp.sendRedirect("forgotpasswordd.jsp");
		CustomerDAO cdao = new CustomerDAOimpl();
		try {
			long phone = Long.parseLong(req.getParameter("phone"));
			String email = req.getParameter("mail");
			String newPassword = req.getParameter("password");
			String confirmPassword = req.getParameter("cpassword");

			// Step 1: Get user from DB
			Customer s = cdao.getCustomer(phone, email);

			// Step 2: Handle user not found
			if (s == null) {
				req.setAttribute("error2", "User not found");
				RequestDispatcher rd = req.getRequestDispatcher("forgot.jsp");
				rd.forward(req, resp);
				return; // Stop execution here
			}

			// Step 3: Check password match
			if (!newPassword.equals(confirmPassword)) {
				req.setAttribute("fail1", "Passwords do not match");
				RequestDispatcher rd = req.getRequestDispatcher("forgot.jsp");
				rd.forward(req, resp);
				return;
			}

			// Step 4: Update password
			s.setPin(Integer.parseInt(confirmPassword));
			boolean updateSuccess = cdao.updateCustomer(s);

			if (updateSuccess) {
				req.setAttribute("Success", "Password successfully updated");
				RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			} else {
				req.setAttribute("fail", "Failed to update password");
				RequestDispatcher rd = req.getRequestDispatcher("forgot.jsp");
				rd.forward(req, resp);
			}

		} catch (Exception e) {
			req.setAttribute("error", "An error occurred: " + e.getMessage());
			RequestDispatcher rd = req.getRequestDispatcher("forgot.jsp");
			rd.forward(req, resp);
		}
	}
}



