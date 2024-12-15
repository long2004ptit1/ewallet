<%@page import="com.entity.Withdraw"%>
<%@page import="com.DAO.WithdrawDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Rút tiền</title>
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
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

.container {
	width: 80%;
	margin: 0 auto;
}

.deposit-form {
	padding: 20px;
	border: 1px solid #ddd;
	background-color: #fff;
	display: flex;
	justify-content: space-between;
}

.form-left, .form-right {
	width: 48%;
}

.form-left label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
	font-size: 18px;
}

.form-left input, .form-left select, .form-left textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

.form-left button {
	width: 100%;
	padding: 15px;
	background-color: #4CAF50;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 18px;
	font-weight: bold;
	color: white;
}

.form-left button:hover {
	background-color: #45a049;
}

p {
	font-size: 16px;
}

.form-right table {
	width: 100%;
	border-collapse: collapse;
}

.form-right table, .form-right th, .form-right td {
	border: 1px solid #ddd;
}

.form-right th, .form-right td {
	padding: 10px;
	text-align: left;
	font-size: 16px;
}

.form-right th {
	background-color: #f2f2f2;
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

h1 {
	text-align: center;
	padding: 20px;
}
</style>
</head>

<body>
<c:if test="${ empty userobj}">
	<c:redirect url="/index.jsp"/>
</c:if>
	<!-- Header placeholder -->
	<div class="header-space">
		<%@include file="all_component/header.jsp"%>
	</div>

	<div class="container">
		<h1>Tạo yêu cầu rút tiền</h1>
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
		<div class="deposit-form">
			<div class="form-left">
				<p>
					Số dư quỹ: <span style="color: green;">${userobj.formattedBalance}
						VND</span>
				</p>
				<form action="withdraw" method="post">
					<label for="amount">Số tiền rút:</label> <input type="number"
						id="amount" placeholder="Số tiền rút" name="amount" required>
					<p style="color: red;">Tối thiểu 10,000 VND, Tối đa 300,000,000
						VND</p>

					<label for="payment-method">Cổng thanh toán:</label> <select
						id="payment-method" name="payment_method">
						<option value="momo">Momo (12)</option>
						<option value="techcombank">Techcombank</option>
						<option value="ACB">ACB</option>
						<option value="ACB">Vietcombank</option>
					</select> <label for="amount">Số tài khoản</label> <input type="number"
						id="account_number" placeholder="Số tài khoản"
						name="account_number"> <label for="amount">Tên tài
						khoản</label> <input type="text" id="account_name"
						placeholder="Tên tài khoản" name="account_name">

					<button type="submit">Rút tiền ngay</button>
				</form>
			</div>

			<div class="form-right">
				<table>
					<tr>
						<th>Hạn mức và phí:</th>
						<th>VND</th>
					</tr>
					<tr>
						<td>Tổng hạn mức ngày</td>
						<td>Không hạn chế</td>
					</tr>
					<tr>
						<td>Số tiền tối thiểu</td>
						<td>10,000 VND</td>
					</tr>
					<tr>
						<td>Số tiền tối đa</td>
						<td>300,000,000 VND</td>
					</tr>
				</table>
				<table style="margin-top: 10px;">
					<tr>
						<th>Cổng thanh toán</th>
						<th>Phí cố định</th>

					</tr>
					<tr>
						<td>Techcombank</td>
						<td>0</td>

					</tr>
					<tr>
						<td>ACB - NH TMCP A CHAU</td>
						<td>0</td>

					</tr>
					<tr>
						<td>Vietcombank</td>
						<td>0</td>

					</tr>
					<tr>
						<td>Momo (12)</td>
						<td>0</td>

					</tr>
				</table>
			</div>
		</div>

		<div class="history-table">
			<h2>Lịch sử rút tiền</h2>
			<table>
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
