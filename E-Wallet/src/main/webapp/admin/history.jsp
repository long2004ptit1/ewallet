<%@page import="com.entity.Transaction"%>
<%@page import="com.DAO.TransactionDAOImpl"%>
<%@page import="com.entity.Deposit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.DepositDAOImpl"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
h2 {
	font-size: 20px;
	padding: 20px;
}

.history-table {
	margin-top: 20px;
	margin-left: 30px;
}

.history-table table {
	width: 70%;
	border-collapse: collapse;
}

.history-table table, .history-table th, .history-table td {
	border: 1px solid #ddd;
}

.history-table th, .history-table td {
	padding: 10px;
	text-align: left;
	font-size: 16px;
	overflow: hidden; /* Ẩn nội dung tràn */
	white-space: nowrap; /* Ngăn ngừa ngắt dòng */
	text-overflow: ellipsis; /* Hiển thị dấu "..." nếu nội dung quá dài */
}

.history-table th {
	background-color: #f2f2f2;
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
	<div class="history-table">

		<h2>Lịch sử chuyển khoản</h2>
		<table>
			<thead>
				<tr>
					<th>Mã giao dịch</th>
					<th>Tài khoản gửi</th>
					<th>Tài khoản nhận</th>
					<th>Số tiền</th>
					<th>Thời gian</th>
					<th>Nội dung</th>

				</tr>
			</thead>
			<tbody>
			<%
    // Tạo DAO và lấy danh sách giao dịch
    TransactionDAOImpl transactionDAO = new TransactionDAOImpl(DBConnect.getConn());
    List<Transaction> transactions = transactionDAO.getAllTransactions();
%>

<tbody>
<%
    if (transactions != null && !transactions.isEmpty()) {
        for (Transaction transaction : transactions) {
%>
            <tr>
                <td><%= transaction.getTransactionId() %></td>
                <td><%= transaction.getSenderUserName() %></td>
                <td><%= transaction.getReceiverUsername() %></td>
                <td><%= transaction.getFormattedAmount() %> Đ</td>
                <td><%= transaction.getTransactionDate() %></td>
                <td><%= transaction.getMessage() != null ? transaction.getMessage() : "Không có nội dung" %></td>
            </tr>
<%
        }
    } else {
%>
        <tr>
            <td colspan="6" style="text-align:center; color:red;">Không có lịch sử giao dịch.</td>
        </tr>
<%
    }
%>
</tbody>
			
			</tbody>


		</table>
	</div>
</body>
</html>