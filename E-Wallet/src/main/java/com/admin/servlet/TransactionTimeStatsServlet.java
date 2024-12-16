package com.admin.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.TransactionDAOImpl;
import com.DB.DBConnect;
import com.google.gson.Gson;

@WebServlet("/TransactionTimeStats")
public class TransactionTimeStatsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = DBConnect.getConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        TransactionDAOImpl dao = new TransactionDAOImpl(conn);
        Map<String, Integer> transactionStatsByDate = dao.getTransactionStatsByDate();

        // Kiểm tra dữ liệu trước khi gửi
        System.out.println("Transaction Stats: " + transactionStatsByDate);

        // Convert Map to JSON
        String json = new Gson().toJson(transactionStatsByDate);

        // Gửi JSON tới client
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}

