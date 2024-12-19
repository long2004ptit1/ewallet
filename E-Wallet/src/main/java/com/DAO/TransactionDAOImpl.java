package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.entity.Transaction;

public class TransactionDAOImpl implements TransactionDAO {
	private Connection conn;

	public TransactionDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public void saveTransaction(Transaction transaction) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO transactions (transaction_id, sender_id, receiver_id, amount, transaction_date, status,message) VALUES (?, ?, ?, ?, ?, ?,?)";

		try (PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) { // Lấy khóa sinh ra
			stmt.setString(1, transaction.getTransactionId());
			stmt.setInt(2, transaction.getSenderId());
			stmt.setInt(3, transaction.getReceiverId());
			stmt.setDouble(4, transaction.getAmount());
			stmt.setTimestamp(5, transaction.getTransactionDate());
			stmt.setString(6, transaction.getStatus());
			stmt.setString(7, transaction.getMessage());// Trạng thái

			stmt.executeUpdate();

			ResultSet rs = stmt.getGeneratedKeys();
			if (rs.next()) {
				transaction.setId(rs.getInt(1)); // Cập nhật id cho đối tượng transaction
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// history

	@Override
	public List<Transaction> getTransactionHistory(int userId) {
        List<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT t.transaction_id, t.amount, " +
                "       receiver.name AS receiver_name, receiver.username AS receiver_username, " +
                "       t.transaction_date, t.status, t.message " +
                "FROM transactions t " +
                "JOIN user receiver ON t.receiver_id = receiver.id " +
                "WHERE t.sender_id = ? " + // Chỉ lấy giao dịch mà user là sender
                "ORDER BY t.transaction_date DESC";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(rs.getString("transaction_id")); 
                transaction.setAmount(rs.getDouble("amount"));                         
                transaction.setReceiverName(rs.getString("receiver_name"));
                transaction.setReceiverUsername(rs.getString("receiver_username")); 

                transaction.setTransactionDate(rs.getTimestamp("transaction_date"));
                transaction.setStatus(rs.getString("status")); 
                transaction.setMessage(rs.getString("message")); 

                transactions.add(transaction);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return transactions;
}
	@Override
	public List<Transaction> getReceivedTransactions(int userId) {
	    List<Transaction> transactions = new ArrayList<>();
	    String sql = "SELECT t.transaction_id, t.amount, " +
	                 "       sender.name AS sender_name, sender.username AS sender_username, " +
	                 "       t.transaction_date, t.status, t.message " +
	                 "FROM transactions t " +
	                 "JOIN user sender ON t.sender_id = sender.id " +
	                 "WHERE t.receiver_id = ? " +
	                 "ORDER BY t.transaction_date DESC";

	    try (PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Transaction transaction = new Transaction();
	            transaction.setTransactionId(rs.getString("transaction_id"));
	            transaction.setAmount(rs.getDouble("amount"));
	            transaction.setSenderName(rs.getString("sender_name"));
	            transaction.setSenderUserName(rs.getString("sender_username"));
	            transaction.setTransactionDate(rs.getTimestamp("transaction_date"));
	            transaction.setStatus(rs.getString("status"));
	            transaction.setMessage(rs.getString("message"));

	            transactions.add(transaction);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return transactions;
	}
	
	

	@Override
	public Map<String, Double[]> getMonthlyCashFlowByUser(int userId) {
	    Map<String, Double[]> cashFlow = new LinkedHashMap<>();
	    String query = "SELECT DATE_FORMAT(created_at, '%Y-%m') AS month, "
	                 + "SUM(CASE WHEN type = 'inflow' THEN amount ELSE 0 END) AS inflow, "
	                 + "SUM(CASE WHEN type = 'outflow' THEN amount ELSE 0 END) AS outflow "
	                 + "FROM ( "
	                 + "  SELECT transaction_date AS created_at, amount, 'outflow' AS type "
	                 + "  FROM transactions WHERE sender_id = ? "
	                 + "  UNION ALL "
	                 + "  SELECT transaction_date AS created_at, amount, 'inflow' AS type "
	                 + "  FROM transactions WHERE receiver_id = ? "
	                 + "  UNION ALL "
	                 + "  SELECT created_at, amount, 'inflow' AS type FROM deposit WHERE user_id = ? "
	                 + "  UNION ALL "
	                 + "  SELECT created_at, amount, 'outflow' AS type FROM withdraw WHERE user_id = ? "
	                 + ") AS combined "
	                 + "GROUP BY DATE_FORMAT(created_at, '%Y-%m') "
	                 + "ORDER BY month";

	    try (PreparedStatement ps = conn.prepareStatement(query)) {
	        ps.setInt(1, userId); // Sender in transactions
	        ps.setInt(2, userId); // Receiver in transactions
	        ps.setInt(3, userId); // Deposit user
	        ps.setInt(4, userId); // Withdraw user
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            String month = rs.getString("month");
	            Double inflow = rs.getDouble("inflow");
	            Double outflow = rs.getDouble("outflow");
	            cashFlow.put(month, new Double[]{inflow, outflow});
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return cashFlow;
	}


}


