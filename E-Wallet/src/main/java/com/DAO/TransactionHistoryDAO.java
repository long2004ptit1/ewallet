package com.DAO;

import java.util.Map;

public interface TransactionHistoryDAO {
    Map<String, Map<String, Integer>> getStatsByTransactionType();
}
