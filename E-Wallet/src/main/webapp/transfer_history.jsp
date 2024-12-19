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

<link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Đảm bảo rằng jQuery đã được tải -->
    <script src="https://cdn.datatables.net/2.1.8/js/dataTables.min.js"></script> <!-- Tải DataTables JS -->
    <script>
        $(document).ready(function() {
            $('#transactions').DataTable();
        });
    </script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Transfer Form</title>
</head>
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
	font-size:20px;
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


<body>

	<!-- Header placeholder -->
	<div class="header-space">
		<%@include file="all_component/header.jsp"%>
	</div>

	<div class="container">


		<div class="history-table">
			<h2>Lịch sử chuyển tiền</h2>
			
			<table id="transactions" class="display">
				<thead>
					<tr>
						<th>Mã giao dịch</th>
						<th>Số tiền</th>
						<th>Tài khoản gửi</th>
						<th>Tên người gửi</th>
						<th>Thời gian</th>
						<th>Trạng thái</th>
						<th>Nội dung</th>
					</tr>
				</thead>
				<tbody>
					<%
						TransactionDAOImpl transactionDao = new TransactionDAOImpl(DBConnect.getConn());

						User sender = (User) session.getAttribute("userobj");

						// Lấy lịch sử giao dịch của người dùng
						List<Transaction> transactionHistory = transactionDao.getTransactionHistory(sender.getId());

						// Kiểm tra nếu có lịch sử giao dịch
						if (transactionHistory != null && !transactionHistory.isEmpty()) {
							// Hiển thị từng giao dịch
							for (Transaction transaction : transactionHistory) {
					%>
					<tr>
						<td><%=transaction.getTransactionId()%></td>
						<td style="color: red"><%="- " + transaction.getFormattedAmount() + " VND"%></td>
						<td><%=transaction.getReceiverUsername()%></td>
						<td><%=transaction.getReceiverName()%></td>

						<td><%=transaction.getTransactionDate()%></td>
						<td><%=transaction.getStatus()%></td>
						<td><%=transaction.getMessage() != null ? transaction.getMessage() : "Không có mô tả"%></td>
					</tr>
					<%
						}
						} else {
					%>
					<tr>
						<td colspan="7" style="text-align: center;">Chưa có lịch sử
							giao dịch nào.</td>
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
