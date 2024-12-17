package com.admin.servlet;

import com.DAO.AdminDAO;
import com.DAO.AdminDAOImpl;
import com.entity.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editAdmin")
public class EditAdminServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy ID của admin từ tham số URL
        int id = Integer.parseInt(request.getParameter("id"));
        
        // Tạo đối tượng AdminDAO để lấy thông tin admin theo ID
        AdminDAO adminDAO = new AdminDAOImpl();
        Admin admin = adminDAO.getAdminById(id);

        if (admin != null) {
            // Đưa đối tượng admin vào request để sử dụng trong trang JSP
            request.setAttribute("admin", admin);
            request.getRequestDispatcher("edit_admin.jsp").forward(request, response);
        } else {
            // Nếu không tìm thấy admin, chuyển hướng về danh sách admin
            response.sendRedirect("admin_list.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        String password = request.getParameter("password");

        // Tạo đối tượng Admin và thiết lập các giá trị
        Admin admin = new Admin();
        admin.setId(id);
        admin.setName(name);
        admin.setUserName(username);
        admin.setEmail(email);
        admin.setPhone(phone);
        admin.setRole(role);
        admin.setPassword(password);

        // Tạo đối tượng AdminDAO để thực hiện cập nhật
        AdminDAO adminDAO = new AdminDAOImpl();
        boolean isUpdated = adminDAO.updateAdmin(admin);

        // Chuyển hướng đến danh sách admin với thông báo thành công hoặc lỗi
        if (isUpdated) {
            response.sendRedirect("admin_list.jsp?success=1");
        } else {
            response.sendRedirect("edit_admin.jsp?id=" + id + "&error=1");
        }
    }
}
