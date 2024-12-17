<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.DAO.AdminDAOImpl" %>
<%@ page import="com.entity.Admin" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.SQLException" %>

<%
    // Lấy ID từ tham số URL
    String adminId = request.getParameter("id");

    if (adminId != null && !adminId.isEmpty()) {
        int id = Integer.parseInt(adminId);  // Chuyển ID sang kiểu số nguyên
        AdminDAOImpl dao = new AdminDAOImpl();	
        
        try {
            // Gọi phương thức để xóa admin theo ID
            boolean isDeleted = dao.deleteAdmin(id);
            if (isDeleted) {
                // Sau khi xóa thành công, chuyển hướng về trang danh sách admin
                response.sendRedirect("admin_list.jsp");  
            } else {
                out.println("<h3>Không thể xóa Admin này!</h3>");
            }
        } catch (Exception e) {
            // Xử lý lỗi chung, bao gồm SQLException và các lỗi khác
            e.printStackTrace();
            out.println("<h3>Đã xảy ra lỗi khi xóa Admin!</h3>");
        }
    } else {
        out.println("<h3>Không tìm thấy Admin để xóa!</h3>");
    }
%>