<%@ page import="com.DAO.AdminDAOImpl" %>
<%@ page import="com.entity.Admin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    try {
        // Lấy các tham số từ request
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        int id = Integer.parseInt(request.getParameter("id"));

        // Kiểm tra không cho phép cập nhật role thành 'super_admin'
        if ("super_admin".equals(role)) {
%>
        <script type="text/javascript">
            alert("Không thể cập nhật role của super_admin!");
            window.history.back(); // Quay lại trang trước
        </script>
<%
            return; // Dừng xử lý ở đây
        }

        AdminDAOImpl dao = new AdminDAOImpl();
        Admin admin = dao.getAdminById(id);

        // Cập nhật thông tin admin
        admin.setName(name);
        admin.setUserName(username);
        admin.setEmail(email);
        admin.setPhone(phone);

        // Kiểm tra mật khẩu mới
        if (password != null && !password.trim().isEmpty()) {
            admin.setPassword(password); // Cập nhật mật khẩu mới
        }

        admin.setRole(role);

        // Thực hiện cập nhật
        boolean isUpdated = dao.updateAdmin(admin);

        if (isUpdated) {
            response.sendRedirect(request.getContextPath() + "/admin/admin_list.jsp");
        } else {
%>
        <script type="text/javascript">
            alert("Không thể cập nhật thông tin Admin. Vui lòng thử lại!");
            window.history.back();
        </script>
<%
        }
    } catch (Exception e) {
%>
    <script type="text/javascript">
        alert("Có lỗi xảy ra: <%= e.getMessage() %>");
        window.history.back();
    </script>
<%
        e.printStackTrace();
    }
%>
