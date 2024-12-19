package com.DAO;

import com.entity.Withdraw;

import java.sql.Timestamp;
import java.util.List;

public interface WithdrawDAO {
    boolean addWithdrawRequest(Withdraw request);
    List<Withdraw> getPendingRequests();
    List<Withdraw> getAllRequests();
    boolean updateRequestStatus(String transactionId, String newStatus, Timestamp approvedAt);
	List<Withdraw> getWithdrawRequestsByUserId(int userId);
	Withdraw getWithdrawById(String transactionId);

}
