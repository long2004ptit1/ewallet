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

import com.DB.DBConnect;

@WebServlet("/deposit")
public class DepositServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("user_id");  // ID của người dùng, lấy từ session hoặc hidden input
        double amount = Double.parseDouble(request.getParameter("amount"));
        String paymentMethod = request.getParameter("payment_method");

        // Tạo mã giao dịch duy nhất
        String requestId = UUID.randomUUID().toString().replace("-", "").substring(0, 12).toUpperCase();

        try (Connection conn = DBConnect.getConn()) {
            String sql = "INSERT INTO deposit_requests (request_id, user_id, amount, payment_method, status) VALUES (?, ?, ?, ?, 'pending')";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, requestId);
            ps.setString(2,userId);
            ps.setDouble(3, amount);
            ps.setString(4, paymentMethod);
            ps.executeUpdate();

            // Gửi thông báo thành công
            request.setAttribute("message", "Yêu cầu nạp tiền đã được gửi. Mã giao dịch: " + requestId);
            request.getRequestDispatcher("deposit.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại.");
            request.getRequestDispatcher("deposit.jsp").forward(request, response);
        }

    }
}
