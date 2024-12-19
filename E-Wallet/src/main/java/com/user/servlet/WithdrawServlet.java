package com.user.servlet;

import com.DAO.WithdrawDAOImpl;
import com.DB.DBConnect;
import com.DAO.UserDAOImpl;
import com.DAO.WithdrawDAO;
import com.entity.User;
import com.entity.Withdraw;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/withdraw")
public class WithdrawServlet extends HttpServlet {
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	
		 HttpSession session = request.getSession();
		  // Lấy userId từ session
		    Integer userId = (Integer) session.getAttribute("user_id");

		    // Kiểm tra xem userId có tồn tại trong session không
		    if (userId == null) {
		        response.sendRedirect("index.jsp");
		        return;
		    }
		 // Thiết lập encoding cho request và response
	        request.setCharacterEncoding("UTF-8");
	        response.setCharacterEncoding("UTF-8");
	        double amount = Double.parseDouble(request.getParameter("amount"));
	        String paymentMethod = request.getParameter("payment_method");
	        String accountNumber = request.getParameter("account_number");
	        String accountName = request.getParameter("account_name");

	        Withdraw withdrawRequest = new Withdraw();
	        withdrawRequest.setUserId(userId);
	        withdrawRequest.setAmount(amount);
	        withdrawRequest.setPaymentMethod(paymentMethod);
	        withdrawRequest.setAccountNumber(accountNumber);
	        withdrawRequest.setAccountName(accountName);
	        
	        
	        try (Connection conn = DBConnect.getConn()) { 
	            UserDAOImpl userDao = new UserDAOImpl(conn);
	            double currentBalance = userDao.getBalanceByUserId(userId);

	            if (currentBalance >= amount) {
	                WithdrawDAO withdrawDao = new WithdrawDAOImpl(conn);
	                boolean success = withdrawDao.addWithdrawRequest(withdrawRequest);

	                if (success) {
	                    double newBalance = currentBalance - amount;
	                    userDao.updateUserBalance(userId, newBalance);
	                    
	                    session.setAttribute("user_balance", newBalance);
	                    
	                    User userobj = (User) session.getAttribute("userobj");
	                    if (userobj != null) {
	                        userobj.setBalance(newBalance); // Cập nhật số dư
	                        session.setAttribute("userobj", userobj); // Lưu lại userobj vào session
	                    }

	                    // Gửi số dư cập nhật tới giao diện
	                    request.setAttribute("new_balance", newBalance);

	                    session.setAttribute("successMessage", "Yêu cầu rút tiền thành công!");
	                } else {
	                    session.setAttribute("errorMessage", "Có lỗi xảy ra khi rút tiền. Vui lòng thử lại.");
	                }
	            } else {
	                session.setAttribute("errorMessage", "Số dư không đủ để thực hiện giao dịch.");
	            }

	            response.sendRedirect("withdraw.jsp");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}
