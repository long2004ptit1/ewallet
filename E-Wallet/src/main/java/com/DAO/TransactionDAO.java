package com.DAO;

import java.util.List;

import com.entity.Transaction;

public interface TransactionDAO {
	void saveTransaction(Transaction transaction);
	 List<Transaction> getTransactionHistory(int userId);
	List<Transaction> getReceivedTransactions(int userId);
}
