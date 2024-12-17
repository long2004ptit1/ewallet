<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DAO.AdminDAO, com.DAO.AdminDAOImpl, com.entity.Admin" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa thông tin Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .form-container {
            width: 100%;
            max-width: 500px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
        }

        h2 {
            text-align: center;
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: 500;
            margin-bottom: 8px;
            color: #555;
        }

        input[type="text"], input[type="email"], input[type="password"], select {
            padding: 12px;
            font-size: 14px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #ddd;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus, select:focus {
            border-color: #007bff;
            outline: none;
        }

        button {
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            background-color: #28a745;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 15px;
        }

        button:hover {
            background-color: #218838;
        }

        .back-button {
            text-align: center;
            margin-top: 20px;
        }

        .back-button a {
            color: #007bff;
            font-size: 14px;
            text-decoration: none;
        }

        .back-button a:hover {
            text-decoration: underline;
        }

        .password-container {
            position: relative;
        }

        .password-container i {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            color: #555;
        }

        .password-container input {
            padding-right: 30px;
        }

        @media (max-width: 768px) {
            .form-container {
                padding: 20px;
            }
            h2 {
                font-size: 24px;
            }
            button {
                font-size: 14px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<%
    // Lấy ID từ request
    int id = Integer.parseInt(request.getParameter("id"));
    AdminDAOImpl dao = new AdminDAOImpl();
    Admin admin = dao.getAdminById(id); // Lấy thông tin admin theo ID

    if (admin == null) {
        out.println("<h3>Admin không tồn tại!</h3>");
        return;
    }
%>

<div class="form-container">
    <h2>Chỉnh sửa thông tin Admin</h2>

    <form action="<%= request.getContextPath() %>/admin/update_admin.jsp" method="post">
        <input type="hidden" name="id" value="<%= admin.getId() %>">
        
        <label for="name">Họ tên:</label>
        <input type="text" name="name" value="<%= admin.getName() %>" required>

        <label for="username">Tên đăng nhập:</label>
        <input type="text" name="username" value="<%= admin.getUserName() %>" required>

        <label for="email">Email:</label>
        <input type="email" name="email" value="<%= admin.getEmail() %>" required>

        <label for="phone">Số điện thoại:</label>
        <input type="text" name="phone" value="<%= admin.getPhone() %>" required>

        <div class="password-container">
            <label for="password">Mật khẩu (để trống nếu không thay đổi):</label>
            <input type="password" name="password" placeholder="Nhập mật khẩu mới">
            <i class="fas fa-eye" id="togglePassword"></i>
        </div>

        <label for="role">Vai trò:</label>
        <select name="role">
        <option value="super_admin">Super Admin</option>
        <option value="admin_withdraw">Admin Withdraw</option>
        <option value="admin_service">Admin Service</option>
        <option value="admin_deposit">Admin Deposit</option>
        <option value="admin_transaction">Admin Transaction</option>
    </select>

        <button type="submit">Cập nhật</button>
    </form>

    <div class="back-button">
        <a href="<%= request.getContextPath() %>/admin/admin_list.jsp">Quay lại danh sách Admin</a>
    </div>
</div>

<script>
    // Toggle mật khẩu
    const togglePassword = document.getElementById('togglePassword');
    const passwordField = document.querySelector('input[name="password"]');

    togglePassword.addEventListener('click', () => {
        // Toggle giữa text và password
        const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordField.setAttribute('type', type);

        // Đổi biểu tượng mắt
        togglePassword.classList.toggle('fa-eye');
        togglePassword.classList.toggle('fa-eye-slash');
    });
</script>

</body>
</html>