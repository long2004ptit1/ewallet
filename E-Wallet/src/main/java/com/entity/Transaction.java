package com.entity;

import java.sql.Timestamp;
import java.util.UUID;

public class Transaction {
	private int id;
	private String transactionId;
	private int senderId;
	private int receiverId;
	private double amount;
	private Timestamp transactionDate;
	private String status;
	private String message;
	
	public Transaction() {
        this.transactionId = generateTransactionId(); // Tạo mã giao dịch
        this.status = "pending"; // Trạng thái mặc định
    }
	
	private String generateTransactionId() {
        // Tạo mã giao dịch ngẫu nhiên
        return "TX-" + UUID.randomUUID().toString().substring(0, 8);
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	
	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public int getSenderId() {
		return senderId;
	}

	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}

	public int getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(int receiverId) {
		this.receiverId = receiverId;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Timestamp getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(Timestamp transactionDate) {
		this.transactionDate = transactionDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
