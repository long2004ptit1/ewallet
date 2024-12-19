package com.DAO;

import com.entity.Withdraw;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WithdrawDAOImpl implements WithdrawDAO {
    private Connection conn;

    public WithdrawDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean addWithdrawRequest(Withdraw request) {
        String sql = "INSERT INTO withdraw ( transaction_id,user_id, amount, payment_method, account_number, account_name, status) VALUES (?, ?, ?, ?, ?, ?, 'Pending')";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, request.getTransactionId()); 
        	stmt.setInt(2, request.getUserId()); 
            stmt.setDouble(3, request.getAmount());
            stmt.setString(4, request.getPaymentMethod());
            stmt.setString(5, request.getAccountNumber());
            stmt.setString(6, request.getAccountName());

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Withdraw> getPendingRequests() {
        List<Withdraw> requests = new ArrayList<>();
        String sql = "SELECT w.*, u.username FROM withdraw w " +
                "JOIN user u ON w.user_id = u.id " +
                "WHERE w.status = 'Pending'";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Withdraw request = new Withdraw();
                request.setTransactionId(rs.getString("transaction_id"));
                request.setUserId(rs.getInt("user_id"));
                request.setUserName(rs.getString("username"));
                request.setAmount(rs.getDouble("amount"));
                request.setPaymentMethod(rs.getString("payment_method"));
                request.setAccountNumber(rs.getString("account_number"));
                request.setAccountName(rs.getString("account_name"));
                request.setStatus(rs.getString("status"));
                request.setCreatedAt(rs.getTimestamp("created_at"));
                request.setApprovedAt(rs.getTimestamp("approved_at"));
                requests.add(request);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return requests;
    }

    @Override
    public boolean updateRequestStatus(String transaction_id, String newStatus, Timestamp approvedAt ) {
        String sql = "UPDATE withdraw SET status = ? , approved_at = ? WHERE transaction_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, newStatus);            
            stmt.setTimestamp(2, approvedAt);
            stmt.setString(3, transaction_id);
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Withdraw> getAllRequests() {
        List<Withdraw> requests = new ArrayList<>();
        String sql = "SELECT w.*, u.username FROM withdraw w " +
                "JOIN user u ON w.user_id = u.id ";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Withdraw request = new Withdraw();
                request.setTransactionId(rs.getString("transaction_id"));
                request.setUserId(rs.getInt("user_id"));
                request.setUserName(rs.getString("username"));
                request.setAmount(rs.getDouble("amount"));
                request.setPaymentMethod(rs.getString("payment_method"));
                request.setAccountNumber(rs.getString("account_number"));
                request.setAccountName(rs.getString("account_name"));
                request.setStatus(rs.getString("status"));
                request.setCreatedAt(rs.getTimestamp("created_at"));
                request.setApprovedAt(rs.getTimestamp("approved_at"));
                requests.add(request);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return requests;
    }
    
    @Override
    public List<Withdraw> getWithdrawRequestsByUserId(int userId) {
        List<Withdraw> requests = new ArrayList<>();
        String sql = "SELECT w.*, u.username FROM withdraw w " +
                     "JOIN user u ON w.user_id = u.id " +
                     "WHERE w.user_id = ?"; // Lọc theo user_id
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId); // Gán giá trị userId vào câu lệnh SQL
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Withdraw request = new Withdraw();
                    request.setTransactionId(rs.getString("transaction_id"));
                    request.setUserId(rs.getInt("user_id"));
                    request.setUserName(rs.getString("username"));
                    request.setAmount(rs.getDouble("amount"));
                    request.setPaymentMethod(rs.getString("payment_method"));
                    request.setAccountNumber(rs.getString("account_number"));
                    request.setAccountName(rs.getString("account_name"));
                    request.setStatus(rs.getString("status"));
                    request.setCreatedAt(rs.getTimestamp("created_at"));
                    request.setApprovedAt(rs.getTimestamp("approved_at"));
                    requests.add(request);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return requests;
    }

    @Override
    public Withdraw getWithdrawById(String transactionId) {
        Withdraw withdraw = null;
        String sql = "SELECT * FROM withdraw WHERE transaction_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, transactionId); // Gán giá trị transaction_id vào câu lệnh SQL
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    withdraw = new Withdraw();
                    withdraw.setTransactionId(rs.getString("transaction_id"));
                    withdraw.setUserId(rs.getInt("user_id"));
                    withdraw.setAmount(rs.getDouble("amount"));
                    withdraw.setPaymentMethod(rs.getString("payment_method"));
                    withdraw.setAccountNumber(rs.getString("account_number"));
                    withdraw.setAccountName(rs.getString("account_name"));
                    withdraw.setStatus(rs.getString("status"));
                    withdraw.setCreatedAt(rs.getTimestamp("created_at"));
                    withdraw.setApprovedAt(rs.getTimestamp("approved_at"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return withdraw;
    }


}
