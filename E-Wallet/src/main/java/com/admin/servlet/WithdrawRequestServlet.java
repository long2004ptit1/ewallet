package com.admin.servlet;

import com.DAO.WithdrawDAOImpl;
import com.DAO.WithdrawDAO;
import com.DB.DBConnect;
import com.entity.Withdraw;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;

@WebServlet("/withdraw_requests")

public class WithdrawRequestServlet extends HttpServlet {
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
            WithdrawDAO dao = new WithdrawDAOImpl(conn);
            boolean success = dao.updateRequestStatus(transactionId, newStatus,approvedAt); 
            if (success) {
/*            	Withdraw requestData = new Withdraw(); // Tạo đối tượng Withdraw mới để ghi lại lịch sử
                requestData.setTransactionId(transactionId);
                dao.logWithdrawHistory(requestData, newStatus, approvedAt);*/
            	
            	
                request.getSession().setAttribute("successMessage", "Yêu cầu rút tiền đã được " + (newStatus.equals("Approved") ? "xác nhận" : "từ chối") + "!");

            } else {
                request.getSession().setAttribute("errorMessage", "Có lỗi xảy ra khi cập nhật trạng thái.");

            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Lỗi khi xử lý yêu cầu.");
        }

        response.sendRedirect("admin/withdraw_requests.jsp");
    }
}