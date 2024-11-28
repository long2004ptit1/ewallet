package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DAO.AdminDAOImpl;
import com.DB.DBConnect;
import com.entity.Admin;

@WebServlet("/register_admin")
public class RegisterAdminServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
        	
        	// Thiết lập encoding cho request và response
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            // Lấy thông tin từ form
            String name = req.getParameter("name");
            String username = req.getParameter("username");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String password = req.getParameter("password");
            String role = req.getParameter("role");

            // Tạo đối tượng Admin
            Admin admin = new Admin();
            admin.setName(name);
            admin.setUserName(username);
            admin.setEmail(email);
            admin.setPhone(phone);
            admin.setPassword(password);
            admin.setRole(role);

            // Khởi tạo session
            HttpSession session = req.getSession();

            // Tạo đối tượng DAO
            AdminDAOImpl dao = new AdminDAOImpl(DBConnect.getConn());

            // Kiểm tra sự tồn tại của username, email, và phone
            if (dao.checkUsernameExists(username)) {
                session.setAttribute("failMsg", "Tên đăng nhập đã tồn tại!");
                resp.sendRedirect("admin/register_admin.jsp");
            } else if (dao.checkEmailExists(email)) {
                session.setAttribute("failMsg", "Email đã tồn tại!");
                resp.sendRedirect("admin/register_admin.jsp");
            } else if (dao.checkPhoneExists(phone)) {
                session.setAttribute("failMsg", "Số điện thoại đã tồn tại!");
                resp.sendRedirect("admin/register_admin.jsp");
            } else {
                // Nếu tất cả các kiểm tra đều hợp lệ, tiến hành đăng ký
                boolean isRegistered = dao.registerAdmin(admin);

                if (isRegistered) {
                    session.setAttribute("succMsg", "Đăng ký Admin thành công!");
                    resp.sendRedirect("admin/register_admin.jsp");
                } else {
                    session.setAttribute("failMsg", "Đã xảy ra lỗi khi đăng ký! Vui lòng thử lại.");
                    resp.sendRedirect("admin/register_admin.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("failMsg", "Đã xảy ra lỗi! Vui lòng thử lại.");
            resp.sendRedirect("admin/register_admin.jsp");
        }
    }
}
