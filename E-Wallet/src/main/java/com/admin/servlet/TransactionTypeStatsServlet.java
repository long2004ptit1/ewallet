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

import com.DAO.TransactionHistoryDAOImpl;
import com.DB.DBConnect;
import com.google.gson.Gson;

@WebServlet("/TransactionTypeStats")
public class TransactionTypeStatsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = DBConnect.getConn();
            TransactionHistoryDAOImpl dao = new TransactionHistoryDAOImpl(conn);
            Map<String, Map<String, Integer>> stats = dao.getStatsByTransactionType();

            String json = new Gson().toJson(stats);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            
            System.out.println(new Gson().toJson(stats));


        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi kết nối cơ sở dữ liệu");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi không xác định");
        }
        
    }
}
