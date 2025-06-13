package com.NewBank.Servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.NewBank.DAO.TransactionDAO;
import com.NewBank.DAO.TransactionDAOimpl;
import com.NewBank.dto.Customer;
import com.NewBank.dto.Transaction;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/passbook")
public class Passbook extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("customer") == null) {
			req.setAttribute("failure", "Session expired. Please login again.");
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
			return;
		}

		Customer customer = (Customer) session.getAttribute("customer");
		TransactionDAO tdao = new TransactionDAOimpl();
		ArrayList<Transaction> passbook = tdao.getTransaction();

		req.setAttribute("passbook", passbook);
		RequestDispatcher rd = req.getRequestDispatcher("passbook.jsp");
		rd.forward(req, resp);
	}
}
