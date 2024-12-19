package com.DAO;

import java.sql.Timestamp;
import java.util.List;

import com.entity.Deposit;

public interface DepositDAO {
	boolean addDepositRequest(Deposit request);
    List<Deposit> getPendingRequests();
    List<Deposit> getAllRequests();
    boolean updateRequestStatus(String transactionId, String newStatus, Timestamp approvedAt);
    List<Deposit> getDepositRequestsByUserId(int userId);
	Deposit getDepositRequestByTransactionId(String transactionId);
}
