package com.entity;

import java.sql.Timestamp;
import java.text.DecimalFormat;
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
	private String receiverName;
    private String receiverUsername;
	
	public Transaction() {
        this.transactionId = generateTransactionId(); 
        this.status = "pending"; 
    }
	
	public String getFormattedAmount() {
        DecimalFormat df = new DecimalFormat("#,###"); 
        return df.format(amount); 
    }
	
	private String generateTransactionId() {
        return "TX-" + UUID.randomUUID().toString().substring(0, 8);
    }
	
	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverUsername() {
		return receiverUsername;
	}

	public void setReceiverUsername(String receiverUsername) {
		this.receiverUsername = receiverUsername;
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
