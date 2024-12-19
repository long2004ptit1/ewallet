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

		<h2>Lịch sử nạp tiền</h2>
		<table>
			<thead>
				<tr>
					<th>Mã đơn</th>
					<th>UserId</th>
					<th>Tên đăng nhập</th>
					<th>Số tiền rút</th>
					<th>Cổng thanh toán</th>
					<th>Số tài khoản</th>
					<th>Tên tài khoản</th>
					<th>Thời gian</th>
					<th>Trạng thái</th>
					<th>Thời gian thao tác</th>

				</tr>
			</thead>
			<tbody>
				<%
				DepositDAOImpl DepositDao = new DepositDAOImpl(DBConnect.getConn());
				List<Deposit> DepositHistory = DepositDao.getAllRequests(); // Lấy lịch sử yêu cầu

				if (DepositHistory != null && !DepositHistory.isEmpty()) {
					for (Deposit req : DepositHistory) {
				%>
				<tr>
					<td><%=req.getTransactionId()%></td>
					<td><%=req.getUserId()%></td>
					<td><%=req.getUserName()%></td>
					<td><%=req.getFormattedAmount() + " Đ"%></td>
					<td><%=req.getPaymentMethod()%></td>
					<td><%=req.getAccountNumber()%></td>
					<td><%=req.getAccountName()%></td>
					<td><%=req.getCreatedAt() != null ? req.getCreatedAt().toString() : "Không có thông tin"%></td>
					<td
						style="
    color: <%="Pending".equals(req.getStatus()) ? "orange"
		: "Approved".equals(req.getStatus()) ? "green" : "Rejected".equals(req.getStatus()) ? "red" : "black"%>;
    font-weight: bold;">
						<%="Pending".equals(req.getStatus()) ? "Chờ xử lý"
		: "Approved".equals(req.getStatus()) ? "Đã chấp nhận"
				: "Rejected".equals(req.getStatus()) ? "Đã từ chối" : "Không xác định"%>
					</td>


					<td><%=req.getApprovedAt() != null ? req.getApprovedAt().toString() : "Chưa duyệt"%></td>
					<!-- Thời gian duyệt -->
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="10" style="text-align: center;">Chưa có lịch sử
						yêu cầu nào.</td>
				</tr>
				<%
				}
				%>

			</tbody>


		</table>
	</div>
</body>
</html>