package com.DAO;

import com.entity.Withdraw;

import java.sql.Timestamp;
import java.util.List;

public interface WithdrawDAO {
    boolean addWithdrawRequest(Withdraw request);
    List<Withdraw> getPendingRequests();
    List<Withdraw> getProcessedRequests();
    boolean updateRequestStatus(String transactionId, String newStatus, Timestamp approvedAt);

}
