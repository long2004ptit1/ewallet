package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.entity.Deposit;

public class DepositDAOImpl implements DepositDAO {  
    private Connection conn;

    public DepositDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean addDepositRequest(Deposit request) {  
        String sql = "INSERT INTO deposit (transaction_id, user_id, amount, account_number, status) VALUES (?, ?, ?, ?, ?, ?, 'Pending')";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, request.getTransactionId());
            stmt.setInt(2, request.getUserId());
            stmt.setDouble(3, request.getAmount());
            //stmt.setString(4, request.getPaymentMethod());
            stmt.setString(4, request.getAccountNumber());
            //stmt.setString(6, request.getAccountName());

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Deposit> getPendingRequests() {  
        List<Deposit> requests = new ArrayList<>();  
        String sql = "SELECT d.*, pm.name AS payment_method_name, pm.account_name " +
                "FROM deposit d " +
                "JOIN payment_methods pm ON d.account_number = pm.account_number " +
                "WHERE d.status = 'Pending'";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
        	 while (rs.next()) {
                 Deposit request = new Deposit();
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
    public List<Deposit> getAllRequests() {  
        List<Deposit> requests = new ArrayList<>();  
        String sql = "SELECT d.*, pm.name AS payment_method_name, pm.account_name " +
                "FROM deposit d " +
                "JOIN payment_methods pm ON d.account_number = pm.account_number";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Deposit request = new Deposit();  
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
    public boolean updateRequestStatus(String transactionId, String newStatus, Timestamp approvedAt) {  
        String sql = "UPDATE deposit SET status = ?, approved_at = ? WHERE transaction_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, newStatus);
            stmt.setTimestamp(2, approvedAt);
            stmt.setString(3, transactionId);

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Deposit> getDepositRequestsByUserId(int userId) {  
        List<Deposit> requests = new ArrayList<>();
        String sql = "SELECT d.*, pm.name AS payment_method_name, pm.account_name " +
                "FROM deposit d " +
                "JOIN payment_methods pm ON d.account_number = pm.account_number " +
                "WHERE d.user_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Deposit request = new Deposit();  
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
}
