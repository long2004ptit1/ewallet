<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.entity.Withdraw"%>
<%@page import="com.DAO.WithdrawDAOImpl"%>
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
            $('#withdraw').DataTable();
        });
    </script>
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
</head>

<body>

	<!-- Header placeholder -->
	<div class="header-space">
		<%@include file="all_component/header.jsp"%>
	</div>

	<div class="container">


		<div class="history-table">
			<h2>Lịch sử rút tiền</h2>
			<table id="withdraw" class="display">
				<thead>
					<tr>
						<th>Mã đơn</th>
						<th>Số tiền</th>
						<th>Ngân hàng</th>
						<th>Tên tài khoản</th>
						<th>Số tài khoản</th>
						<th>Ngày tạo</th>
						<th>Trạng thái</th>
						<th>Ngày xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						// Tạo đối tượng DAO cho yêu cầu rút tiền
						WithdrawDAOImpl withdrawDao = new WithdrawDAOImpl(DBConnect.getConn());

						// Lấy người dùng từ session
						User receiver = (User) session.getAttribute("userobj");

						// Lấy danh sách yêu cầu rút tiền của người dùng
						List<Withdraw> withdrawRequests = withdrawDao.getWithdrawRequestsByUserId(receiver.getId());

						// Kiểm tra danh sách yêu cầu rút tiền
						if (withdrawRequests != null && !withdrawRequests.isEmpty()) {
							for (Withdraw withdraw : withdrawRequests) {
								String statusColor = "black";
								String statusText = withdraw.getStatus();
								if ("Approved".equalsIgnoreCase(statusText)) {

									statusColor = "green"; // Đã duyệt - Màu xanh lá
								} else if ("Rejected".equalsIgnoreCase(statusText)) {
									statusColor = "red"; // Bị từ chối - Màu đỏ
								} else if ("Pending".equalsIgnoreCase(statusText)) {
									statusColor = "orange"; // Đang chờ - Màu cam
								}
					%>
					<tr>
						<td><%=withdraw.getTransactionId()%></td>
						<td><%=withdraw.getFormattedAmount()%> VND</td>
						<td><%=withdraw.getPaymentMethod()%></td>
						<td><%=withdraw.getAccountName()%></td>
						<td><%=withdraw.getAccountNumber()%></td>
						<td><%=withdraw.getCreatedAt()%></td>
						<td style="color: <%=statusColor%>;">
							<%
								if ("Approved".equalsIgnoreCase(statusText)) {
											out.print("Đã duyệt");
										} else if ("Rejected".equalsIgnoreCase(statusText)) {
											out.print("Bị từ chối");
										} else if ("Pending".equalsIgnoreCase(statusText)) {
											out.print("Đang chờ");
										} else {
											out.print("Không xác định");
										}
							%>

						</td>

						<td><%=withdraw.getApprovedAt() != null ? withdraw.getApprovedAt() : "Chưa phê duyệt"%></td>
					
					</tr>
					<%
						}
						} else {
					%>
					<tr>
						<td colspan="8" style="text-align: center;">Chưa có yêu cầu
							rút tiền nào.</td>
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
