<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.entity.Transaction"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.TransactionDAOImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.User"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Transfer Form</title>

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
	text-transform: capitalize;
	transition: .2s linear;
}

/* Add space for header */
.header-space {
	height: 80px;
	background-color: #f1f1f1;
	text-align: center;
	line-height: 20px;
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 20px;
}

.container {
	width: 80%;
	margin: 0 auto;
}


/* Cỡ chữ cho bảng lịch sử chuyển tiền */
h2 {
	padding: 20px;
}

.history-table {
	margin-top: 20px;
}

.history-table table {
	width: 100%;
	border-collapse: collapse;
}

.history-table table, .history-table th, .history-table td {
	border: 1px solid #ddd;
}

.history-table th, .history-table td {
	padding: 10px;
	text-align: left;
	font-size: 16px;
}

.history-table th {
	background-color: #f2f2f2;
}
</style>
</head>

<body>

	<!-- Header placeholder -->
	<div class="header-space">
		<%@include file="all_component/header.jsp"%>
	</div>

	<div class="container">


		<div class="history-table">
			<h2>Lịch sử nhận tiền</h2>
			<table>
				<thead>
					<tr>
						<th>Mã giao dịch</th>
						<th>Số tiền</th>
						<th>Tài khoản nhận</th>
						<th>Tên người nhận</th>
						<th>Thời gian</th>
						<th>Trạng thái</th>
						<th>Nội dung</th>
					</tr>
				</thead>
				<tbody>
					<%
					// Tạo đối tượng DAO
					TransactionDAOImpl transactionDao = new TransactionDAOImpl(DBConnect.getConn());

					// Lấy người dùng từ session
					User receiver = (User) session.getAttribute("userobj");

					// Lấy danh sách giao dịch nhận tiền
					List<Transaction> receivedTransactions = transactionDao.getReceivedTransactions(receiver.getId());

					// Kiểm tra danh sách giao dịch nhận tiền
					if (receivedTransactions != null && !receivedTransactions.isEmpty()) {
						for (Transaction transaction : receivedTransactions) {
					%>
					<tr>
						<td><%=transaction.getTransactionId()%></td>
						<td style="color: green">+ <%=transaction.getFormattedAmount()%>
							VND
						</td>
						<td><%=transaction.getSenderUserName()%></td>
						<td><%=transaction.getSenderName()%></td>
						<td><%=transaction.getTransactionDate()%></td>
						<td><%=transaction.getStatus()%></td>
						<td><%=transaction.getMessage() != null ? transaction.getMessage() : "Không có mô tả"%></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="7" style="text-align: center;">Chưa có giao dịch
							nhận tiền nào.</td>
					</tr>
					<%
					}
					%>
				</tbody>


			</table>
		</div>
	</div>

</body>

</html>
