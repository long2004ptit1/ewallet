package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

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
		String sql = "INSERT INTO transactions (transaction_id, sender_id, receiver_id, amount, transaction_date, status) VALUES (?, ?, ?, ?, ?, ?)";
	    
	    try (PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) { // Lấy khóa sinh ra
	        stmt.setString(1, transaction.getTransactionId());
	        stmt.setInt(2, transaction.getSenderId());
	        stmt.setInt(3, transaction.getReceiverId());
	        stmt.setDouble(4, transaction.getAmount());
	        stmt.setTimestamp(5, transaction.getTransactionDate());
	        stmt.setString(6, transaction.getStatus()); // Trạng thái

	        stmt.executeUpdate();

	        // Lấy id tự động tăng
	        ResultSet rs = stmt.getGeneratedKeys();
	        if (rs.next()) {
	            transaction.setId(rs.getInt(1)); // Cập nhật id cho đối tượng transaction
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
