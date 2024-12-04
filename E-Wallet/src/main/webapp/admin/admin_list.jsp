<%@ page import="com.entity.Admin" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.AdminDAOImpl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách Admin</title>
    <!-- Link tới Font Awesome để sử dụng icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Reset một số kiểu mặc định của trình duyệt */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fa;
            color: #333;
        }

        .header-space {
            height: 80px;
            background-color: #4CAF50;
            text-align: center;
            line-height: 80px;
            font-size: 24px;
            font-weight: bold;
            color: white;
        }

        h2 {
            text-align: center;
            margin: 20px 0;
            font-size: 24px;
            color: #333;
        }

        .history-table {
            margin: 0 auto;
            padding: 20px;
            max-width: 1200px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            font-size: 16px;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .button {
            padding: 10px;
            border-radius: 50%;
            color: white;
            background-color: #4CAF50;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #45a049;
        }

        .btn-reject {
            background-color: #f44336;
        }

        .btn-reject:hover {
            background-color: #d32f2f;
        }

        /* Thêm hiệu ứng cho các icon */
        .button i {
            font-size: 18px;
        }

        .action-btns {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        /* Chỉnh sửa icon và button */
        .action-btns a {
            text-decoration: none;
        }

    </style>
</head>
<body>
    <!-- Header placeholder -->
    <div class="header-space">
        <%@ include file="header.jsp" %>
    </div>

    <div class="history-table">
        <h2>Danh sách Admin</h2>
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Họ tên</th>
                    <th>Tên đăng nhập</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>
                    <th>Mật khẩu</th>
                    <th>Vai trò</th>
                    <th>Thời gian tạo</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Khởi tạo AdminDAOImpl và lấy danh sách admin
                    AdminDAOImpl dao = new AdminDAOImpl();
                    List<Admin> list = dao.getAllAdmins();
                    for (Admin admin : list) {
                %>
                <tr>
                    <td><%= admin.getId() %></td>
                    <td><%= admin.getName() %></td>
                    <td><%= admin.getUserName() %></td>
                    <td><%= admin.getEmail() %></td>
                    <td><%= admin.getPhone() %></td>
                    <td><%= admin.getPassword() %></td>
                    <td><%= admin.getRole() %></td>
                    <td><%= admin.getCreatedAt() %></td>
                    <td class="action-btns">
                        <a href="<%= request.getContextPath() %>/admin/edit_admin.jsp?id=<%= admin.getId() %>" class="button">
                            <i class="fas fa-edit"></i> <!-- Icon chỉnh sửa -->
                        </a>
                        <a href="<%= request.getContextPath() %>/admin/delete_admin.jsp?id=<%= admin.getId() %>"
                           class="button btn-reject" 
                           onclick="return confirm('Bạn có chắc chắn muốn xóa admin này không?');">
                            <i class="fas fa-trash-alt"></i> <!-- Icon xóa -->
                        </a>
                    </td>
                </tr>
                <% } %>             
            </tbody>
        </table>
    </div>
</body>
</html>
