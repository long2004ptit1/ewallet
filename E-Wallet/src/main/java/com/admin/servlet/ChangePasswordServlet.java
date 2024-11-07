package com.admin.servlet;

import com.DAO.UserDAO;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userobj");

        // Kiểm tra người dùng có trong phiên làm việc không
        if (user == null) {
            session.setAttribute("errorMessage", "Không tìm thấy người dùng trong phiên làm việc.");
            response.sendRedirect("change_password.jsp");
            return;
        }

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Kiểm tra mật khẩu hiện tại
        if (!user.getPassword().equals(currentPassword)) {
            session.setAttribute("errorMessage", "Mật khẩu hiện tại không đúng.");
            response.sendRedirect("change_password.jsp");
            return;
        }

        // Kiểm tra sự trùng khớp của mật khẩu mới
        if (!newPassword.equals(confirmPassword)) {
            session.setAttribute("errorMessage", "Mật khẩu mới không trùng khớp.");
            response.sendRedirect("change_password.jsp");
            return;
        }

        try {
            UserDAO userDao = new UserDAOImpl(DBConnect.getConn());
            boolean isUpdated = userDao.changePassword(user.getId(), newPassword);

            if (isUpdated) {
                session.setAttribute("successMessage", "Mật khẩu đã được cập nhật thành công.");
                user.setPassword(newPassword); // Cập nhật mật khẩu trong phiên làm việc
            } else {
                session.setAttribute("errorMessage", "Không thể cập nhật mật khẩu.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Đã xảy ra lỗi.");
        }

        response.sendRedirect("change_password.jsp");
    }
}

