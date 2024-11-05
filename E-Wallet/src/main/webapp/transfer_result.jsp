<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.entity.Transaction"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.TransactionDAOImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Kết quả chuyển tiền</title>
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
	text-transform: capitalize;
	transition: .2s linear;
}
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background-color: #f9f9f9;
	margin: 0;
}

.result-container {
	width: 700px;
	height:500px;
	padding: 30px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.success-message {
	color: green;
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
}

h2 {
	font-size: 24px;
	margin-bottom: 20px;
	margion-top:10px;
}

.transaction-details {
	text-align: left;
	margin-bottom: 20px;
}

.transaction-details p {
	margin: 5px 0;
	font-size: 18px;
	line-height: 2;
}

.status {
	color: white;
	background-color: green;
	padding: 2px 7px;
	border-radius: 5px;
	display: inline-block;
}

.btn-history {
	padding: 10px 20px;
	font-size: 16px;
	color: green;
	background-color: white; 
	border: 2px solid green;/* Khung màu xanh */
	border-radius: 5px;
	cursor: pointer;
	text-decoration: none;
	font-weight: bold;
	transition: background-color 0.3s, color 0.3s;
}

.btn-history:hover {
	background-color: green; /* Đổi nền thành màu xanh khi hover */
	color: white; /* Đổi chữ thành màu trắng khi hover */
}

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
	<div class="result-container">
		<p class="success-message">Chuyển tiền thành công!</p>
		<h2>Kết quả chuyển tiền</h2>
		
		
		
		<c:if test="${not empty transactionResult}">
			<div class="transaction-details">
				<p><strong>Mã giao dịch:</strong> ${transactionResult.transactionId}</p>
				<p><strong>Tài khoản nhận:</strong> ${transactionResult.receiverUsername}</p>
				<p><strong>Tên người nhận:</strong> ${transactionResult.receiverName}</p>
				<p><strong>Số tiền:</strong> ${transactionResult.getFormattedAmount()} VND</p>
				<p><strong>Nội dung:</strong> ${transactionResult.message}</p>
				<p><strong>Thời gian:</strong> ${transactionResult.transactionDate}</p>
				<p><strong>Trạng thái:</strong> <span class="status">Thành công</span></p>
			</div>
		</c:if>

		<a href="transaction_history.jsp" class="btn-history">Xem lịch sử</a>
	</div>
</body>
</html>
