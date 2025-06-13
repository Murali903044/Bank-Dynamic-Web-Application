//package com.NewBank.Servlet;
//
//import java.io.IOException;
//
//import com.NewBank.DAO.CustomerDAOimpl;
//import com.NewBank.dto.Customer;
//
//import jakarta.servlet.RequestDispatcher;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//@WebServlet("/login")
//public class Login extends HttpServlet {
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        HttpSession session = req.getSession(true);
//        CustomerDAOimpl cdao = new CustomerDAOimpl();
//        
//        try {
//            long ACC_no = Long.parseLong(req.getParameter("Acc_no"));
//            int pin = Integer.parseInt(req.getParameter("pin"));
//            Customer c = cdao.getCustomer(ACC_no, pin);
//            
//            if (c != null) {
//                if (c.getACC_NO() == 1100110011) {  // Admin check
//                    session.setAttribute("user", c);  // Store user in session
//                    RequestDispatcher rd = req.getRequestDispatcher("Adminpage.jsp");
//                    rd.forward(req, resp);
//                } else {
//                    session.setAttribute("user", c);  // Store user in session
//                    req.setAttribute("Success", "Login Successfully");
//                    RequestDispatcher rd = req.getRequestDispatcher("Homepage.jsp");
//                    rd.forward(req, resp);
//                }
//            } else {
//                req.setAttribute("error", "Sorry! Failed to login");
//                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
//                rd.forward(req, resp);
//            }
//        } catch (NumberFormatException e) {
//            req.setAttribute("error", "Invalid input format");
//            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
//            rd.forward(req, resp);
//        }
//    }
//}
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

import java.io.IOException;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class Login extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(true);
		CustomerDAOimpl cdao=new CustomerDAOimpl();

		long ACC_no=Long.parseLong(req.getParameter("accountnumber"));
		int pin=Integer.parseInt(req.getParameter("password"));
		Customer c=cdao.getCustomer(ACC_no, pin);

		if(c!=null) { 
			session.setAttribute("customer", c);
			if(c.getACC_NO()==1100110011) {
				//        		req.setAttribute("success", "login successfull");
				RequestDispatcher rd=req.getRequestDispatcher("Adminpage.jsp");
				rd.forward(req, resp);
			}
			else {
				//        		req.setAttribute("error", "login failed");
				RequestDispatcher rd=req.getRequestDispatcher("Customerpage.jsp");
				rd.forward(req, resp);
			}

		}else {
			session.setAttribute("fail", "Failed to login!");
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}

	}
}

