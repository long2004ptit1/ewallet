package com.user.servlet;

import com.DAO.WithdrawDAOImpl;
import com.DB.DBConnect;
import com.DAO.WithdrawDAO; // Sử dụng interface
import com.entity.Withdraw;
import java.util.UUID;
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
		        session.setAttribute("errorMessage", "Vui lòng đăng nhập để thực hiện rút tiền.");
		        response.sendRedirect("index.jsp");
		        return;
		    }
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
	            WithdrawDAO dao = new WithdrawDAOImpl(conn);
	            boolean success = dao.addWithdrawRequest(withdrawRequest);
	            if (success) {
	                request.getSession().setAttribute("successMessage", "Yêu cầu rút tiền thành công!");
	                response.sendRedirect("withdraw.jsp");
	            } else {
	                request.getSession().setAttribute("errorMessage", "Có lỗi xảy ra khi rút tiền. Vui lòng thử lại.");
	                response.sendRedirect("withdraw.jsp");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            request.getSession().setAttribute("errorMessage", "Lỗi khi xử lý yêu cầu.");
	            response.sendRedirect("withdraw.jsp");
	        }
        
    }
}
