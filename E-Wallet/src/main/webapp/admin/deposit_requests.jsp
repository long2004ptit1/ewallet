
<%@page import="com.entity.Deposit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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
	padding: 20px;
	font-size: 20px;
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

/*button  */
button {
	font-size: 14px;
	font-weight: bold;
	padding: 8px 16px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.btn-approve {
	background-color: #4CAF50;
	color: white;
}

.btn-approve:hover {
	background-color: #45a049;
}

.btn-reject {
	background-color: #f44336;
	color: white;
}

.btn-reject:hover {
	background-color: #d32f2f;
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
	<!-- Header placeholder -->
	<div class="header-space">
		<%@include file="header.jsp"%>
	</div>
	<div class="history-table">
		<c:if test="${not empty successMessage}">
			<p
				style="color: green; text-align: center; font-weight: bold; font-size: 20px;">${successMessage}</p>
			<c:remove var="successMessage" scope="session" />
			<!-- xoa thong bao cu -->
		</c:if>

		<c:if test="${not empty errorMessage}">
			<p
				style="color: red; text-align: center; font-weight: bold; font-size: 20px;">${errorMessage}</p>
			<c:remove var="errorMessage" scope="session" />
			<!-- xoa thong bao cu -->
		</c:if>
		<h2>Yêu cầu nạp tiền</h2>
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
					<th>Thao tác</th>

				</tr>
			</thead>
			<tbody>
				<%
    // Khai báo DAO để lấy yêu cầu nạp tiền
    DepositDAOImpl depositDao = new DepositDAOImpl(DBConnect.getConn());
    
    // Lấy danh sách yêu cầu nạp tiền
    List<Deposit> depositRequests = depositDao.getPendingRequests();
    
    // Kiểm tra nếu có yêu cầu nạp tiền
    if (depositRequests != null && !depositRequests.isEmpty()) {
        // Hiển thị từng yêu cầu nạp tiền
        for (Deposit req : depositRequests) {
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
					<td><%=req.getStatus()%>
					<td>
						<form action="../deposit_requests" method="post"
							style="display: inline;">
							<input type="hidden" name="transaction_id"
								value="<%=req.getTransactionId()%>">
							<button type="submit" name="action" value="approve"
								class="btn-approve">Xác nhận</button>
						</form>
						<form action="../deposit_requests" method="post"
							style="display: inline;">
							<input type="hidden" name="transaction_id"
								value="<%=req.getTransactionId()%>">
							<button type="submit" name="action" value="reject"
								class="btn-reject">Từ chối</button>
						</form>
					</td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="10" style="text-align: center; color: red;">Chưa
						có yêu cầu nạp tiền nào.</td>
				</tr>
				<%
				}
				%>
				<tr>
            <td colspan="10" style="text-align: center;">
                <a href="deposit_history.jsp" class="button btn-approve" style="font-size: 16px; padding: 10px 20px; text-decoration: none; display: inline-block;">Xem lịch sử</a>
            </td>
        </tr>
			</tbody>

			<!-- Add history rows here -->
		</table>
	</div>
</body>
</html>