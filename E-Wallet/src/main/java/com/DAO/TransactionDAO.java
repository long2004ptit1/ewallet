package com.DAO;

import java.util.List;
import java.util.Map;

import com.entity.Transaction;

public interface TransactionDAO {
	void saveTransaction(Transaction transaction);
	 List<Transaction> getTransactionHistory(int userId);
	List<Transaction> getReceivedTransactions(int userId);
	
	 Map<String, Integer> getTransactionStatsByDate();
	 public Map<String, Double[]> getMonthlyCashFlowByUser(int userId);
}
