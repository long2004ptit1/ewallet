<%@page import="java.util.List"%>
<%@page import="com.DAO.DepositRequestDAO"%>
<%@page import="com.entity.DepositRequest"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.DepositRequest"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
}

.history-table th {
	background-color: #f2f2f2;
}</style>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="history-table">
			<h2>Yêu cầu nạp tiền</h2>
			<table>
			<thead>
				<tr>
										<th>Mã đơn</th>
					<th>Tên đăng nhập</th>
					<th>Số tiền nạp</th>
					<th>Cổng thanh toán</th>
					<th>Thời gian</th>
					<th>Trạng thái</th>

				</tr>
				</thead>
				<tbody>
            <%
                DepositRequestDAO dao = new DepositRequestDAO(DBConnect.getConn());
                List<DepositRequest> requests = dao.getPendingRequests();
                for (DepositRequest depositRequest : requests) {
            %>
            <tr>
                <td><%= depositRequest.getRequestId() %></td>
                <td><%= depositRequest.getUsername() %></td> <!-- Giả sử bạn có phương thức lấy tên đăng nhập người dùng -->
                <td><%= depositRequest.getAmount() %> VND</td>
                <td><%= depositRequest.getPaymentMethod() %></td>
                <td><%= depositRequest.getRequestTime() %></td>
                <td>
                    <a href="confirmDeposit?requestId=<%= depositRequest.getRequestId() %>" class="btn btn-sm btn-primary">Xác nhận</a>
                    <a href="cancelDeposit?requestId=<%= depositRequest.getRequestId() %>" class="btn btn-sm btn-danger">Hủy</a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
				<!-- Add history rows here -->
			</table>
		</div>
</body>
</html>