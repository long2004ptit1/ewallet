package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;
import java.util.List;

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
	    String message = request.getParameter("message");

	    double amount = Double.parseDouble(amountStr);
        HttpSession session = request.getSession();
	    User sender = (User) request.getSession().getAttribute("userobj");
	    
	    try (Connection conn = DBConnect.getConn()) {
	        UserDAOImpl userDao = new UserDAOImpl(conn);
	        TransactionDAO transactionDAO = new TransactionDAOImpl(conn);

	        User receiver = userDao.getUserByUsernameOrEmailOrPhone(receiverUsername);

	        if (receiver != null && amount > 0) {
	        
	        	if (receiver.getId() == sender.getId()) {
                    session.setAttribute("errorMessage", "Bạn không thể chuyển tiền cho chính mình.");
                } else {

                    double senderBalance = userDao.getBalanceByUserId(sender.getId());
                    if (senderBalance >= amount) {

                        userDao.updateUserBalance(sender.getId(), senderBalance - amount);
                        sender.setBalance(senderBalance - amount);
                        session.setAttribute("userobj", sender);


                        double receiverBalance = userDao.getBalanceByUserId(receiver.getId());
                        userDao.updateUserBalance(receiver.getId(), receiverBalance + amount);

                        // Tạo đối tượng Transaction
                        Transaction transaction = new Transaction();
                        transaction.setSenderId(sender.getId());
                        transaction.setReceiverId(receiver.getId());
                        transaction.setAmount(amount);
                        transaction.setTransactionDate(new Timestamp(System.currentTimeMillis()));
                        transaction.setStatus("completed");
                        transaction.setMessage(message);
                        
                        transaction.setReceiverUsername(receiverUsername);
                        
                        transactionDAO.saveTransaction(transaction);

                        session.setAttribute("transactionResult", transaction); // Lưu giao dịch hiện tại

                        List<Transaction> transactionHistory = transactionDAO.getTransactionHistory(sender.getId());
                        request.setAttribute("transactionHistory", transactionHistory); // Đưa lịch sử giao dịch vào request
                        
                        response.sendRedirect("transfer_result.jsp");
                        return;
                        
                    } else {

                        session.setAttribute("errorMessage", "Số dư không đủ để thực hiện giao dịch.");
                    }
                }
            } else {
                // Thông báo lỗi nếu người nhận không tồn tại
                session.setAttribute("errorMessage", "Người nhận không tồn tại.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Đã xảy ra lỗi trong quá trình chuyển tiền.");
        } finally {
        	if (session.getAttribute("errorMessage") != null) {
                response.sendRedirect("transfer.jsp");
        }
    }
}
	
}


