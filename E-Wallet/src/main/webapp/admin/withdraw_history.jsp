<%@page import="com.entity.Withdraw"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.WithdrawDAOImpl"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allCss.jsp"%>
<style>h2 {
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
}</style>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="history-table">

			<h2>Lịch sử rút tiền</h2>
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
                WithdrawDAOImpl withdrawDao = new WithdrawDAOImpl(DBConnect.getConn());
                List<Withdraw> withdrawHistory = withdrawDao.getProcessedRequests(); // Lấy lịch sử yêu cầu

                if (withdrawHistory != null && !withdrawHistory.isEmpty()) {
                    for (Withdraw req : withdrawHistory) {
            %>
                <tr>
                    <td><%= req.getTransactionId() %></td>
                    <td><%= req.getUserId() %></td>
                    <td><%= req.getUserName() %></td>
                    <td><%= req.getFormattedAmount() + " Đ" %></td>
                    <td><%= req.getPaymentMethod() %></td>
                    <td><%= req.getAccountNumber() %></td>
                    <td><%= req.getAccountName() %></td>
                    <td><%= req.getCreatedAt() != null ? req.getCreatedAt().toString() : "Không có thông tin" %></td>
                    <td><%= req.getStatus() %></td>
                    <td><%= req.getApprovedAt() != null ? req.getApprovedAt().toString() : "Chưa duyệt" %></td> <!-- Thời gian duyệt -->
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="10" style="text-align:center;">Chưa có lịch sử yêu cầu nào.</td>
                </tr>
            <%
                }
            %>
</tbody>


			</table>
		</div>
</body>
</html>