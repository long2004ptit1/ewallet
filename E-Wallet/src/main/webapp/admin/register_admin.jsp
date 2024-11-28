<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;300;400;500;600&display=swap")
	;

body {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f5f5f5;
}

form {
    background-color: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
    font-size: 18px; /* Tăng cỡ chữ */
    margin-top:100px;

}

input[type="text"],
input[type="email"],
input[type="password"],
input[type="number"] {
    width: calc(100% - 20px);
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px; /* Tăng cỡ chữ */
    display: block;
    text-transform: none;
}

.form-check-label {
    font-size: 16px; /* Tăng cỡ chữ */
}

button {
    width: 100%;
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.2s ease; /* Tạo hiệu ứng chuyển đổi */
}

button:hover {
    background-color:#f1c40f; /* Hiệu ứng khi hover */
}

input:focus, 
textarea:focus, 
select:focus {
    border-color: #007bff; /* Đổi màu viền khi focus vào */
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Tạo hiệu ứng shadow khi focus */
}

select {
    width: calc(100% - 20px);
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px; /* Cỡ chữ */
    background-color: white;
    color: #333;
}
/* Add space for header */
.header-space {
	height: 60px;
	background-color: #f1f1f1;
	text-align: center;
	line-height: 15px;
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;


}

h1 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
    text-align: center;
}

</style>
</head>
<body>
<!-- Header placeholder -->
	<div class="header-space">
		<%@include file="header.jsp"%>
	</div>

<form action="../register_admin" method="post">
	<h1> Đăng ký Admin</h1>
	<c:if test="${not empty succMsg}">
							<p style="color:green; text-align:center;font-weight: bold;">${succMsg}</p>
							<c:remove var="succMsg" scope="session"/> <!-- xoa thong bao cu -->
						</c:if>
						
						<c:if test="${not empty failMsg}">
							<p style="color:red; text-align:center;font-weight: bold">${failMsg}</p>
							<c:remove var="failMsg" scope="session"/> <!-- xoa thong bao cu -->
						</c:if>
						<div class="form-group">
								<label>Họ tên*</label> <input type="text" name="name" required
									class="form-control" >
									</div>
							<div class="form-group">
								<label>Tên đăng nhập *</label> <input type="text" name="username" required
									class="form-control" >
							</div>
							<div class="form-group">
								<label> Email *</label> <input type="email" name="email"
									required class="form-control">
							</div>
							
							<div class="form-group">
								<label> Số điện thoại*</label> <input type="number" name="phone"
									required class="form-control">
							</div>
							
							<div class="form-group">
								<label>Mật khẩu *</label> <input type="text" name="password"
									required class="form-control">
									
							</div>
							<div class="form-group">
							<label for="role">Vai trò:</label>
        <select id="role" name="role" required>
            <option value="super_admin">Super Admin</option>
            <option value="admin_withdraw">Admin Withdraw</option>
            <option value="admin_service">Admin Service</option>
            <option value="admin_deposit">Admin Deposit</option>
            <option value="admin_transaction">Admin Transaction</option>
        </select><br><br>
							</div>
							
							<button type="submit">Đăng ký</button>
						</form>
</body>
</html>