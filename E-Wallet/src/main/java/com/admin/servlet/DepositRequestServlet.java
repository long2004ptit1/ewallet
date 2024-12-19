package com.admin.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DepositDAO;
import com.DAO.DepositDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Deposit;

@WebServlet("/deposit_requests")
public class DepositRequestServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String transactionId = request.getParameter("transaction_id");
        String action = request.getParameter("action");

        String newStatus = "Rejected";
        Timestamp approvedAt = null;
        if ("approve".equals(action)) {
            newStatus = "Approved";
            approvedAt = new Timestamp(System.currentTimeMillis());
        }else {
            approvedAt = new Timestamp(System.currentTimeMillis());}
        
        HttpSession session = request.getSession();
        try (Connection conn = DBConnect.getConn()) { 
            DepositDAO dao = new DepositDAOImpl(conn);
            boolean success = dao.updateRequestStatus(transactionId, newStatus,approvedAt); 
            if (success) {
                if ("Approved".equals(newStatus)) {
                	DepositDAO depositDao = new DepositDAOImpl(conn);
                	 Deposit deposit = depositDao.getDepositRequestByTransactionId(transactionId);
                     if (deposit!=null) {
                    	 int userId = deposit.getUserId();
                         double amount = deposit.getAmount();

                         UserDAOImpl userDAO = new UserDAOImpl(conn);
                         double currentBalance = userDAO.getBalanceByUserId(userId);
                         userDAO.updateUserBalance(userId, currentBalance + amount);

                        session.setAttribute("successMessage", "Yêu cầu rút tiền đã được xác nhận!");
                        session.setAttribute("messageType", "success");
						
					}
                } else {
                    session.setAttribute("errorMessage", "Yêu cầu rút tiền đã bị từ chối!");
                    session.setAttribute("messageType", "error");
                }

            } else {
                request.getSession().setAttribute("errorMessage", "Có lỗi xảy ra khi cập nhật trạng thái.");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("admin/deposit_requests.jsp");
    }
}
