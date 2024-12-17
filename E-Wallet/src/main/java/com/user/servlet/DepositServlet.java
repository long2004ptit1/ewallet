package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DepositDAOImpl;
import com.DAO.DepositDAO;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Deposit;

@WebServlet("/deposit")
public class DepositServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// Lấy userId từ session
		Integer userId = (Integer) session.getAttribute("user_id");

		double amount = Double.parseDouble(request.getParameter("amount"));
		String paymentMethod = request.getParameter("payment_method");
		String accountNumber = request.getParameter("account_number");
		String accountName = request.getParameter("account_name");
		
		Deposit depositRequest = new Deposit();
		depositRequest.setUserId(userId);
		depositRequest.setAmount(amount);
		depositRequest.setPaymentMethod(paymentMethod);
		depositRequest.setAccountNumber(accountNumber);
		depositRequest.setAccountName(accountName);
		
		try (Connection conn = DBConnect.getConn()) { 
            UserDAOImpl userDao = new UserDAOImpl(conn);
            double currentBalance = userDao.getBalanceByUserId(userId);


                DepositDAO depositDAO = new DepositDAOImpl(conn);
                boolean success = depositDAO.addDepositRequest(depositRequest);

                if (success) {
                    double newBalance = currentBalance - amount;
                    userDao.updateUserBalance(userId, newBalance);
                    
                    // Cập nhật số dư mới vào session
                    session.setAttribute("user_balance", userDao.getBalanceByUserId(userId));

                    session.setAttribute("successMessage", "Yêu cầu nạp tiền thành công!");
                } else {
                    session.setAttribute("errorMessage", "Có lỗi xảy ra khi nạp tiền. Vui lòng thử lại.");
                }
            

            response.sendRedirect("deposit.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
