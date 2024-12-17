<%@ page import="com.DAO.AdminDAOImpl" %>
<%@ page import="com.entity.Admin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // Lấy các tham số từ request
    String name = request.getParameter("name");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String password = request.getParameter("password"); // Mật khẩu mới
    String role = request.getParameter("role");
    int id = Integer.parseInt(request.getParameter("id"));

    AdminDAOImpl dao = new AdminDAOImpl();
    Admin admin = new Admin();
    admin.setId(id);
    admin.setName(name);
    admin.setUserName(username);
    admin.setEmail(email);
    admin.setPhone(phone);

    // Kiểm tra nếu mật khẩu không thay đổi (trường mật khẩu rỗng), giữ nguyên mật khẩu cũ
    if (password == null || password.trim().isEmpty()) {
        Admin currentAdmin = dao.getAdminById(id); // Lấy admin hiện tại để giữ nguyên mật khẩu cũ
        admin.setPassword(currentAdmin.getPassword()); // Giữ nguyên mật khẩu cũ
    } else {
        admin.setPassword(password); // Nếu có mật khẩu mới, cập nhật mật khẩu mới
    }
    
    admin.setRole(role);

    // Cập nhật admin
    boolean isUpdated = dao.updateAdmin(admin);

    if (isUpdated) {
        response.sendRedirect(request.getContextPath() + "/admin/admin_list.jsp");
    } else {
        out.println("<h3>Không thể cập nhật thông tin Admin!</h3>");
    }
    if ("super_admin".equals(admin.getRole())) {
        // Bạn có thể ném một exception hoặc trả về false để không cho phép cập nhật role thành 'super_admin'
        throw new IllegalArgumentException("Không thể thay đổi role của super_admin");
    }

%>