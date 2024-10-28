package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.TransactionDAO;
import com.DAO.TransactionDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Transaction;
import com.entity.User;

@WebServlet("/transfer")
public class TransferServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String receiverUsername = request.getParameter("receiver");
	    String amountStr = request.getParameter("amount");
	    String message = request.getParameter("message"); // Lấy nội dung chuyển

	    double amount = Double.parseDouble(amountStr);
        HttpSession session = request.getSession();
	    User sender = (User) request.getSession().getAttribute("userobj");
	    
	    // Tạo kết nối cơ sở dữ liệu
	    try (Connection conn = DBConnect.getConn()) {
	        UserDAOImpl userDao = new UserDAOImpl(conn);
	        TransactionDAO transactionDAO = new TransactionDAOImpl(conn);

	        // Tìm người nhận từ database
	        User receiver = userDao.getUserByUsernameOrEmailOrPhone(receiverUsername);

	        if (receiver != null && amount > 0) {
	            // Kiểm tra số dư của người gửi
	        	double senderBalance = userDao.getBalanceByUserId(sender.getId());
                if (senderBalance >= amount) {
                    // Cập nhật số dư của người gửi
                    userDao.updateUserBalance(sender.getId(), senderBalance - amount);

                    // Cập nhật số dư của người nhận
                    double receiverBalance = userDao.getBalanceByUserId(receiver.getId());
                    userDao.updateUserBalance(receiver.getId(), receiverBalance + amount);

	                // Tạo đối tượng Transaction
	                Transaction transaction = new Transaction();
	                transaction.setSenderId(sender.getId());
	                transaction.setReceiverId(receiver.getId());
	                transaction.setAmount(amount);
	                transaction.setTransactionDate(new Timestamp(System.currentTimeMillis()));
	                transaction.setStatus("completed"); // Đặt trạng thái thành công
	                transaction.setMessage(message); // Lưu nội dung chuyển tiền

	                // Lưu giao dịch vào database
	                transactionDAO.saveTransaction(transaction);


                    session.setAttribute("successMessage", "Chuyển tiền thành công!");
                    response.sendRedirect("transfer.jsp"); // Chuyển hướng đến trang thành công
                } else {
                    // Sử dụng session để thông báo lỗi

                    session.setAttribute("errorMessage", "Số dư không đủ để thực hiện giao dịch.");
                    response.sendRedirect("transfer.jsp"); // Chuyển hướng lại đến trang chuyển tiền
                }
            } else {
                // Sử dụng session để thông báo lỗi

                session.setAttribute("errorMessage", "Người nhận không tồn tại.");
                response.sendRedirect("transfer.jsp"); // Chuyển hướng lại đến trang chuyển tiền
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}
