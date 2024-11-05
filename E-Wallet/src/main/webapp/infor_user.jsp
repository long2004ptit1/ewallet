<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;300;400;500;600&display=swap")
	;

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
	max-width: 800px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 80px;
	
}

.container h2 {
	text-align: left;
	font-size: 24px;
	font-weight: bold;
	border-bottom: 2px solid #007bff;
	padding-bottom: 10px;
	margin-bottom: 20px;
}

.info-table text {
	width: 100%;
	border-collapse: collapse;
	
}

.info-table td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	font-size: 16px;
}

.info-table td:first-child {
	font-weight: bold;
	width: 25%;
	color: #333;
}

.status-label {
	color: #fff;
	background-color: #d9534f;
	padding: 5px 10px;
	border-radius: 5px;
	font-size: 14px;
}

.verify-link {
	color: #007bff;
	text-decoration: none;
	font-size: 14px;
	margin-left: 10px;
}

.action-buttons {
	text-align: center;
	margin-top: 20px;
}

.action-buttons button {
	font-size: 14px;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin: 5px;
	color: #fff;
}

.edit-btn {
	background-color: #5cb85c;
}

.password-btn {
	background-color: #6c757d;
}

.delete-btn {
	background-color: red;
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
		<%@include file="all_component/header.jsp"%>
	</div>

	<div class="container">
		<h2>THÔNG TIN TÀI KHOẢN</h2>
		<c:if test="${not empty userobj}">
			<table class="info-table">
				<tr>
					<td>Họ và tên:</td>
					<td>${userobj.name}</td>
				</tr>
				<tr>
					<td>Tên đăng nhập:</td>
					<td  style="text-transform: none;">${userobj.userName}</td>
				</tr>
				<tr>
					<td>Số dư:</td>
					<td >${userobj.formattedBalance}VND</td>
				</tr>
				<tr>
					<td>Email:</td>
					<td style="text-transform: none;">${userobj.email}</td>
				</tr>
				<tr>
					<td>Số điện thoại:</td>
					<td>${userobj.phone}</td>
				</tr>
				<tr>
					<td>Ngày đăng ký:</td>
					<td>${userobj.createdAt}</td>
				</tr>
			</table>
		</c:if>
		<div class="action-buttons">
			<button class="edit-btn">Đổi thông tin cá nhân</button>
			<button class="password-btn">Đổi mật khẩu</button>
			<button class="delete-btn">Xoá tài khoản</button>
		</div>
	</div>






</body>
</html>