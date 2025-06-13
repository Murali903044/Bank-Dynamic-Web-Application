package com.NewBank.Servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true); // Don't create a new session

        if (session != null) {
            session.invalidate(); // End the session
        }

        // Always show logout success regardless of session existence
        session.setAttribute("success", "You have been logged out successfully!");
        RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
        rd.forward(req, resp);
    }
}
