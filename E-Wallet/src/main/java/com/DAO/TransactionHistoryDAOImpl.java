package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

public class TransactionHistoryDAOImpl implements TransactionHistoryDAO {
    private Connection conn;

    public TransactionHistoryDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public Map<String, Map<String, Integer>> getStatsByTransactionType() {
        Map<String, Map<String, Integer>> stats = new LinkedHashMap<>();
        try {
            // Query số lượng giao dịch từ bảng transactions
            String transactionQuery = "SELECT DATE_FORMAT(transaction_date, '%Y-%m') AS month, COUNT(*) AS total "
                                    + "FROM transactions GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')";
            stats.put("transactions", getStatsByQuery(transactionQuery));

            // Query số lượng giao dịch từ bảng deposit chỉ với status = 'approved'
            String depositQuery = "SELECT DATE_FORMAT(created_at, '%Y-%m') AS month, COUNT(*) AS total "
                                + "FROM deposit WHERE status = 'approved' GROUP BY DATE_FORMAT(created_at, '%Y-%m')";
            stats.put("deposit", getStatsByQuery(depositQuery));

            // Query số lượng giao dịch từ bảng withdraw chỉ với status = 'approved'
            String withdrawQuery = "SELECT DATE_FORMAT(created_at, '%Y-%m') AS month, COUNT(*) AS total "
                                  + "FROM withdraw WHERE status = 'approved' GROUP BY DATE_FORMAT(created_at, '%Y-%m')";
            stats.put("withdraw", getStatsByQuery(withdrawQuery));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stats;
    }

    private Map<String, Integer> getStatsByQuery(String query) {
        Map<String, Integer> stats = new LinkedHashMap<>();
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                stats.put(rs.getString("month"), rs.getInt("total"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stats;
    }

}
