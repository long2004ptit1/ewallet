package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.DepositRequest;

public class DepositRequestDAO {
    private Connection conn;

    public DepositRequestDAO(Connection conn) {
        this.conn = conn;
    }

    public List<DepositRequest> getPendingRequests() {
        List<DepositRequest> requests = new ArrayList<>();
        String sql = "SELECT dr.*, u.username FROM deposit_requests dr JOIN user u ON dr.user_id = u.id WHERE dr.status = 'pending'";

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                DepositRequest request = new DepositRequest();
                request.setRequestId(rs.getString("request_id"));
                request.setUserId(rs.getInt("user_id"));
                request.setAmount(rs.getDouble("amount"));
                request.setPaymentMethod(rs.getString("payment_method"));
                request.setRequestTime(rs.getTimestamp("request_time"));
                request.setStatus(rs.getString("status"));
                request.setUsername(rs.getString("username")); // Lấy tên đăng nhập từ bảng user
                requests.add(request);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return requests;
    }

}
