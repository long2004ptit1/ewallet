package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/updateUserInfo")
public class UpdateUserInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Lấy thông tin từ form
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Lấy thông tin người dùng từ session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userobj");

        if (user != null) {
            // Cập nhật thông tin user
            user.setEmail(email);
            user.setPhone(phone);

            try {
                // Tạo kết nối từ DBConnect và truyền vào DAO
                Connection conn = DBConnect.getConn();
                UserDAOImpl dao = new UserDAOImpl(conn);

                // Gọi phương thức update
                boolean isUpdated = dao.updateUserInfo(user);

                if (isUpdated) {
                    // Cập nhật lại session và chuyển hướng với thông báo thành công
                    session.setAttribute("userobj", user);
                    response.sendRedirect("infor_user.jsp?success=1");
                } else {
                    // Chuyển hướng với thông báo lỗi
                    response.sendRedirect("infor_user.jsp?error=1");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("infor_user.jsp?error=1");
            }
        } else {
            // Người dùng không hợp lệ, chuyển hướng đến login
            response.sendRedirect("login.jsp");
        }
    }
}
