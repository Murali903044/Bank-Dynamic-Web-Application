package com.NewBank.Servlet;

import java.io.IOException;

import com.NewBank.dto.TransactionID;
import com.NewBank.DAO.CustomerDAO;
import com.NewBank.DAO.CustomerDAOimpl;
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


@WebServlet("/deposit")
public class Deposit extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		Customer c=(Customer)session.getAttribute("customer");
		CustomerDAO cdao=new CustomerDAOimpl();
		Transaction t1=null;
		TransactionDAO tdao=new TransactionDAOimpl();
		int amount=Integer.parseInt(req.getParameter("amount"));
		c.setBalance(c.getBalance()+amount);
		boolean res=cdao.updateCustomer(c);
		if(res) {
			t1=new Transaction();
			t1.setTransactionId(TransactionID.generateTransactionId());
			t1.setUser(c.getACC_NO());
			t1.setRec_acc(c.getACC_NO());
			t1.setTransaction("CREDITED");
			t1.setAmount(amount);
			t1.setBalance(c.getBalance());
			boolean res1=tdao.insertTransaction(t1);
			if(res) {
				session.setAttribute("Success", "Amount of Rs." + amount + "has been added Successfully!.....");
				RequestDispatcher rd=req.getRequestDispatcher("Customerpage.jsp");
				rd.forward(req, resp);
			}
			else {
				session.setAttribute("fail", "Failed to Desposit Amount..Try Again!");
				RequestDispatcher rd=req.getRequestDispatcher("Desposit.jsp");
				rd.forward(req, resp);
			}
		}
	}
	//	@Override
	//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//	    HttpSession session = req.getSession();
	//	    Customer c =null;
	//
	//	    if (c == null) {
	//	        session.setAttribute("fail", "Session expired or customer not found. Please login again.");
	//	        RequestDispatcher rd = req.getRequestDispatcher("login.jsp"); // or home.jsp
	//	        rd.forward(req, resp);
	//	        return;
	//	    }
	//
	//	    CustomerDAO cdao = new CustomerDAOimpl();
	//	    Transaction t1 = null;
	//	    TransactionDAO tdao = new TransactionDAOimpl();
	//
	//	    int amount = Integer.parseInt(req.getParameter("amount"));
	//	    c.setBalance(c.getBalance() + amount);
	//	    boolean res = cdao.updateCustomer(c);
	//
	//	    if (res) {
	//	        t1 = new Transaction();
	//	        t1.setTransactionId(TransactionID.generateTransactionId());
	//	        t1.setUser(c.getACC_NO());
	//	        t1.setRec_acc(c.getACC_NO());
	//	        t1.setTransaction("CREDITED");
	//	        t1.setAmount(amount);
	//	        t1.setBalance(c.getBalance());
	//
	//	        boolean res1 = tdao.insertTransaction(t1);
	//	        if (res1) {
	//	            session.setAttribute("Success", "Amount of Rs." + amount + " has been added Successfully!");
	//	            RequestDispatcher rd = req.getRequestDispatcher("Trasctiondetails.jsp");
	//	            rd.forward(req, resp);
	//	        } else {
	//	            session.setAttribute("fail", "Failed to record transaction. Try again!");
	//	            RequestDispatcher rd = req.getRequestDispatcher("Desposit.jsp");
	//	            rd.forward(req, resp);
	//	        }
	//	    } else {
	//	        session.setAttribute("fail", "Failed to update balance. Try again!");
	//	        RequestDispatcher rd = req.getRequestDispatcher("Desposit.jsp");
	//	        rd.forward(req, resp);
	//	    }
	//	}
	//	@Override
	//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//	    HttpSession session = req.getSession();
	//	    Customer c = (Customer) session.getAttribute("customer"); // ✅ FIXED LINE
	//
	//	    if (c == null) {
	//	        session.setAttribute("fail", "Session expired or customer not found. Please login again.");
	//	        RequestDispatcher rd = req.getRequestDispatcher("login.jsp"); // or home.jsp
	//	        rd.forward(req, resp);
	//	        return;
	//	    }
	//
	//	    CustomerDAO cdao = new CustomerDAOimpl();
	//	    Transaction t1 = null;
	//	    TransactionDAO tdao = new TransactionDAOimpl();
	//
	//	    int amount = Integer.parseInt(req.getParameter("amount"));
	//	    c.setBalance(c.getBalance() + amount);
	//	    boolean res = cdao.updateCustomer(c);
	//
	//	    if (res) {
	//	        t1 = new Transaction();
	//	        t1.setTransactionId(TransactionID.generateTransactionId());
	//	        t1.setUser(c.getACC_NO());
	//	        t1.setRec_acc(c.getACC_NO());
	//	        t1.setTransaction("CREDITED");
	//	        t1.setAmount(amount);
	//	        t1.setBalance(c.getBalance());
	//
	//	        boolean res1 = tdao.insertTransaction(t1);
	//	        if (res1) {
	//	            session.setAttribute("Success", "Amount of Rs." + amount + " has been added Successfully!");
	//	            session.setAttribute("customer", c); // ✅ UPDATE session with new balance
	//	            RequestDispatcher rd = req.getRequestDispatcher("Trasctiondetails.jsp");
	//	            rd.forward(req, resp);
	//	        } else {
	//	            session.setAttribute("fail", "Failed to record transaction. Try again!");
	//	            RequestDispatcher rd = req.getRequestDispatcher("Desposit.jsp");
	//	            rd.forward(req, resp);
	//	        }
	//	    } else {
	//	        session.setAttribute("fail", "Failed to update balance. Try again!");
	//	        RequestDispatcher rd = req.getRequestDispatcher("Desposit.jsp");
	//	        rd.forward(req, resp);
	//	    }
	//	}


}
