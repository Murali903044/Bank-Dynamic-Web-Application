package com.NewBank.Servlet;

import java.io.IOException;

import com.NewBank.DAO.CustomerDAO;
import com.NewBank.DAO.CustomerDAOimpl;
import com.NewBank.DAO.TransactionDAO;
import com.NewBank.DAO.TransactionDAOimpl;
import com.NewBank.dto.Customer;
import com.NewBank.dto.Transaction;
import com.NewBank.dto.TransactionID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/transfer")
public class TransferAmount extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		Customer sender = (Customer) session.getAttribute("customer"); // Logged-in customer

		if (sender == null) {
			session.setAttribute("fail", "Session expired. Please login again.");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
			return;
		}

		// Get transfer details from request
		double amount = Double.parseDouble(req.getParameter("amount"));
		long receiverAccNo = Long.parseLong(req.getParameter("raccount"));
		int pin = Integer.parseInt(req.getParameter("password"));

		CustomerDAO cdao = new CustomerDAOimpl();
		TransactionDAO tdao = new TransactionDAOimpl();
		Customer receiver = cdao.getCustomer(receiverAccNo);

		// Validation checks
		if (receiver == null || sender.getACC_NO() == receiverAccNo) {
			session.setAttribute("fail", "Invalid receiver account.");
			req.getRequestDispatcher("Transferamount.jsp").forward(req, resp);
			return;
		}

		if (sender.getBalance() < amount || amount <= 0) {
			session.setAttribute("fail", "Insufficient balance or invalid amount.");
			req.getRequestDispatcher("Transferamount.jsp").forward(req, resp);
			return;
		}

		if (pin != sender.getPin()) {
			session.setAttribute("fail", "Incorrect PIN.");
			req.getRequestDispatcher("Transferamount.jsp").forward(req, resp);
			return;
		}

		// Begin Transfer
		sender.setBalance(sender.getBalance() - amount);
		boolean senderUpdated = cdao.updateCustomer(sender);

		if (senderUpdated) {
			Transaction t1 = new Transaction();
			t1.setTransactionId(TransactionID.generateTransactionId());
			t1.setUser(sender.getACC_NO());
			t1.setRec_acc(receiver.getACC_NO());
			t1.setTransaction("DEBITED");
			t1.setAmount(amount);
			t1.setBalance(sender.getBalance());

			tdao.insertTransaction(t1);

			receiver.setBalance(receiver.getBalance() + amount);
			boolean receiverUpdated = cdao.updateCustomer(receiver);

			if (receiverUpdated) {
				Transaction t2 = new Transaction();
				t2.setTransactionId(t1.getTransactionId()); // same transaction ID
				t2.setUser(receiver.getACC_NO());
				t2.setRec_acc(sender.getACC_NO());
				t2.setTransaction("CREDITED");
				t2.setAmount(amount);
				t2.setBalance(receiver.getBalance());

				tdao.insertTransaction(t2);

				session.setAttribute("Success", "Transaction of Rs." + amount + " transferred successfully.");
				req.getRequestDispatcher("Customerpage.jsp").forward(req, resp);
			} else {
				session.setAttribute("fail", "Transaction failed while crediting receiver.");
				req.getRequestDispatcher("Transferamount.jsp").forward(req, resp);
			}
		} else {
			session.setAttribute("fail1", "Transaction failed while debiting sender.");
			req.getRequestDispatcher("Transferamount.jsp").forward(req, resp);
		}
	}

}


