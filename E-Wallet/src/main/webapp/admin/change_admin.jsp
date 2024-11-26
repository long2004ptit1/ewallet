<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa thông tin Admin</title>
<style>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;300;400;500;600&display=swap");

* {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    outline: none;
    border: none;
    text-decoration: none;
    transition: .2s linear;
}

.container {
    max-width: 600px;
    margin: 50px auto;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 30px;
}

h2 {
    text-align: center;
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    font-weight: bold;
    color: #333;
    font-size: 14px;
}

.form-group input, .form-group select {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-top: 5px;
}

.action-buttons {
    text-align: center;
    margin-top: 20px;
}

.action-buttons button {
    font-size: 16px;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    color: #fff;
}

.save-btn {
    background-color: #4CAF50;
}

.cancel-btn {
    background-color: #f44336;
    margin-left: 10px;
}
/* Add space for header */
.header-space {
	height: 80px;
	background-color: #f1f1f1;
	text-align: center;
	line-height: 20px;
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}
</style>
</head>
<body>
<div class="header-space">
 <%@include file="header.jsp"%>
    </div>
    <div class="container">
        <h2>Chỉnh sửa thông tin Admin</h2>
        
        <!-- Form without real data -->
        <form action="#" method="post">
            <div class="form-group">
                <label for="name">Họ tên</label>
                <input type="text" id="name" name="name" value="Nguyễn Văn A" required>
            </div>
            
            <div class="form-group">
                <label for="username">Tên đăng nhập</label>
                <input type="text" id="username" name="username" value="nguyenvana" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="admin@example.com" required>
            </div>
            
            <div class="form-group">
                <label for="phone">Số điện thoại</label>
                <input type="text" id="phone" name="phone" value="0123456789" required>
            </div>
            
            <div class="form-group">
                <label for="password">Mật khẩu</label>
                <input type="password" id="password" name="password" value="password123" required>
            </div>
            
            <div class="form-group">
                <label for="role">Vai trò</label>
                <select id="role" name="role" required>
                    <option value="admin" selected>Admin_service</option>
                    <option value="superadmin">Super Admin</option>
                </select>
            </div>
            
            <div class="action-buttons">
                <button type="submit" class="save-btn">Lưu thay đổi</button>
                <button type="button" class="cancel-btn" onclick="window.location.href='adminList.jsp'">Hủy bỏ</button>
            </div>
        </form>
    </div>
</body>
</html>
