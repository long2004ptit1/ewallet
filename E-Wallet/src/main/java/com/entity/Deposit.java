package com.entity;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.UUID;

public class Deposit {
	private int id;
	private String transactionId;
    private int userId;
    private double amount;
    private String paymentMethod;
    private String accountNumber;
    private String accountName;
    private String status;
    private Timestamp createdAt;
    private Timestamp approvedAt;
    private String userName;
    
    
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
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public Timestamp getApprovedAt() {
		return approvedAt;
	}
	public void setApprovedAt(Timestamp approvedAt) {
		this.approvedAt = approvedAt;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
    
    
	public Deposit() {
        this.transactionId = generateTransactionId(); // Tạo mã giao dịch
        this.status = "pending"; // Trạng thái mặc định
    }
	
	public String getFormattedAmount() {
        DecimalFormat df = new DecimalFormat("#,###"); 
        return df.format(amount); 
    }
	
	private String generateTransactionId() {
        return "DP-" + UUID.randomUUID().toString().substring(0, 8);
    }
}
