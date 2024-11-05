package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/getReceiverName")
public class GetReceiverNameServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String receiverName = ""; // Khởi tạo biến tên người nhận

        try (Connection conn = DBConnect.getConn()) {
            UserDAOImpl userDao = new UserDAOImpl(conn);
            // Lấy thông tin người nhận bằng phương thức getUserByUsernameOrEmailOrPhone
            User user = userDao.getUserByUsernameOrEmailOrPhone(username);
            if (user != null) {
                receiverName = user.getName(); // Lấy tên người nhận
            } else {
                receiverName = "Tài khoản không tồn tại"; // Thông báo nếu không tìm thấy người nhận
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Trả về tên người nhận hoặc thông báo dưới dạng plain text
        response.setContentType("text/plain; charset=UTF-8");
        response.getWriter().write(receiverName); // Trả về tên người nhận hoặc thông báo
    }
}
