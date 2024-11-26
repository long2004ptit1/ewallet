<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đổi Mật Khẩu</title>
<style>
    /* General Reset */
    * {
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        background-color: #f9f9f9;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        background-color: #ffffff;
        border: 1px solid #ddd;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        width: 400px;
        padding: 30px;
    }

    .container h2 {
        text-align: center;
        color: #333;
        font-size: 22px;
        font-weight: 600;
        margin-bottom: 20px;
        border-bottom: 2px solid #007bff;
        padding-bottom: 10px;
    }

    .notification {
        padding: 10px;
        border-radius: 8px;
        font-size: 14px;
        font-weight: 500;
        color: #fff;
        text-align: center;
        margin-bottom: 20px;
        display: none;
    }

    .notification.success {
        background-color: #28a745;
    }

    .notification.error {
        background-color: #dc3545;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        font-size: 14px;
        font-weight: 500;
        color: #555;
        margin-bottom: 8px;
        display: block;
    }

    .form-group input[type="password"] {
        width: 100%;
        padding: 10px;
        font-size: 15px;
        color: #333;
        background-color: #f9f9f9;
        border: 1px solid #ddd;
        border-radius: 8px;
        transition: border-color 0.2s ease;
    }

    .form-group input[type="password"]:focus {
        border-color: #007bff;
        outline: none;
        background-color: #ffffff;
        box-shadow: 0px 0px 4px rgba(0, 123, 255, 0.2);
    }

    .form-buttons {
        text-align: center;
        margin-top: 25px;
    }

    .form-buttons .btn {
        font-size: 15px;
        padding: 10px 20px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.2s ease;
        color: #ffffff;
        margin: 5px;
    }

    .form-buttons .btn-success {
        background-color: #28a745;
    }

    .form-buttons .btn-success:hover {
        background-color: #218838;
    }

    .form-buttons .btn-secondary {
        background-color: #6c757d;
    }

    .form-buttons .btn-secondary:hover {
        background-color: #5a6268;
    }
</style>
<script>
    // JavaScript to show notification inside the form
    function showNotification(type, message) {
        var notification = document.getElementById("notification");
        notification.className = "notification " + type;
        notification.innerText = message;
        notification.style.display = "block";
    }

    // Trigger notification if messages exist
    window.onload = function() {
        <% if (session.getAttribute("successMessage") != null) { %>
            showNotification("success", "<%= session.getAttribute("successMessage") %>");
            <% session.removeAttribute("successMessage"); %>
        <% } else if (session.getAttribute("errorMessage") != null) { %>
            showNotification("error", "<%= session.getAttribute("errorMessage") %>");
            <% session.removeAttribute("errorMessage"); %>
        <% } %>
    };
</script>
</head>
<body>
<div class="header-space">
		<%@include file="all_component/header.jsp"%>
	</div>

    <div class="container">
        <h2>Đổi Mật Khẩu</h2>

        <!-- Notification Display inside the form -->
        <div id="notification" class="notification"></div>

        <form action="ChangePasswordServlet" method="post">
            <div class="form-group">
                <label>Mật khẩu hiện tại:</label>
                <input type="password" name="currentPassword" required>
            </div>
            
            <div class="form-group">
                <label>Mật khẩu mới:</label>
                <input type="password" name="newPassword" required>
            </div>
            
            <div class="form-group">
                <label>Xác nhận mật khẩu mới:</label>
                <input type="password" name="confirmPassword" required>
            </div>
            
            <div class="form-buttons">
                <button type="submit" class="btn btn-success">Xác nhận</button>
                <button type="button" class="btn btn-secondary" onclick="window.location.href='infor_user.jsp'">Hủy</button>
            </div>
        </form>
    </div>
</body>
</html>
