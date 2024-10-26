package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;

@WebServlet("/transfer")
public class TransferServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int senderId = Integer.parseInt(req.getParameter("senderId"));
            int receiverId = Integer.parseInt(req.getParameter("receiverId"));
            float amount = Float.parseFloat(req.getParameter("amount"));

            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
            HttpSession session = req.getSession();

            // Check if sender has sufficient balance
            if (dao.canTransfer(senderId, amount)) {
                // Deduct amount from sender
                float newSenderBalance = dao.getBalance(senderId) - amount;
                dao.updateBalance(senderId, newSenderBalance);

                // Add amount to receiver
                float newReceiverBalance = dao.getBalance(receiverId) + amount;
                dao.updateBalance(receiverId, newReceiverBalance);

                session.setAttribute("succMsg", "Transfer successful!");
                resp.sendRedirect("transfer.jsp");
            } else {
                session.setAttribute("failMsg", "Insufficient balance.");
                resp.sendRedirect("transfer.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }
}
