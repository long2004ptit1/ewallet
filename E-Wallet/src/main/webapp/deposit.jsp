<%@page import="com.entity.Deposit"%>
<%@page import="com.DAO.DepositDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.DAO.PaymentMethodDAOimpl"%>
<%@ page import="com.entity.PaymentMethod" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nạp tiền</title>
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

	<!-- Header placeholder -->
	<div class="header-space">
		<%@include file="all_component/header.jsp"%>
	</div>

	<div class="container">
		<h1>Tạo yêu cầu nạp tiền</h1>

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
				<form action="deposit" method="post">
					<input type="hidden" name="user_id" value="${sessionScope.user.id}">
					<label for="amount">Số tiền nạp:</label> <input type="number"
						id="amount" placeholder="Số tiền nạp" name="amount">
					<p style="color: red;">Tối thiểu 10,000 VND, Tối đa 500,000 VND</p>

					<label for="payment_method">Cổng thanh toán:</label> <select
						name="payment_method" id="payment_method">
						<option value="">Chọn cổng thanh toán</option>
						<%
						// Lấy danh sách các phương thức thanh toán từ cơ sở dữ liệu
						PaymentMethodDAOimpl paymentMethodDao = new PaymentMethodDAOimpl(DBConnect.getConn());
						List<PaymentMethod> paymentMethods = paymentMethodDao.getAllPaymentMethod();

						for (PaymentMethod method : paymentMethods) {
						%>
						<option value="<%=method.getAccountNumber()%>"
							data-account-name="<%=method.getAccountName()%>">
							<%=method.getName()%>
						</option>
						<%
						}
						%>
					</select> <label for="amount">Số tài khoản</label> <input type="number"
						id="account_number" name="account_number" readonly> <label
						for="amount">Tên tài khoản</label> <input type="text"
						id="account_name" name="account_name" readonly>



					<button type="submit">Nạp tiền ngay</button>
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
						<td>2,000,000 VND</td>
					</tr>
					<tr>
						<td>Số tiền tối thiểu</td>
						<td>10,000 VND</td>
					</tr>
					<tr>
						<td>Số tiền tối đa</td>
						<td>500,000 VND</td>
					</tr>
				</table>

			</div>
		</div>

		<div class="history-table">
			<h2>Lịch sử nạp tiền</h2>
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
					DepositDAOImpl depositDao = new DepositDAOImpl(DBConnect.getConn());

					// Lấy người dùng từ session
					User receiver = (User) session.getAttribute("userobj");

					// Lấy danh sách yêu cầu rút tiền của người dùng
					List<Deposit> DepositRequests = depositDao.getDepositRequestsByUserId(receiver.getId());

					// Kiểm tra danh sách yêu cầu rút tiền
					if (DepositRequests != null && !DepositRequests.isEmpty()) {
						for (Deposit deposit : DepositRequests) {
							String statusColor = "black";
							String statusText = deposit.getStatus();
							if ("Approved".equalsIgnoreCase(statusText)) {

						statusColor = "green"; // Đã duyệt - Màu xanh lá
							} else if ("Rejected".equalsIgnoreCase(statusText)) {
						statusColor = "red"; // Bị từ chối - Màu đỏ
							} else if ("Pending".equalsIgnoreCase(statusText)) {
						statusColor = "orange"; // Đang chờ - Màu cam
							}
					%>
					<tr>
						<td><%=deposit.getTransactionId()%></td>
						<td><%=deposit.getFormattedAmount()%> VND</td>
						<td><%=deposit.getPaymentMethod()%></td>
						<td><%=deposit.getAccountName()%></td>
						<td><%=deposit.getAccountNumber()%></td>
						<td><%=deposit.getCreatedAt()%></td>
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

						<td><%=deposit.getApprovedAt() != null ? deposit.getApprovedAt() : "Chưa phê duyệt"%></td>

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


<script>
document.addEventListener("DOMContentLoaded", function () {
    const paymentMethodSelect = document.getElementById("payment_method");
    const accountNumberInput = document.getElementById("account_number");
    const accountNameInput = document.getElementById("account_name");

    paymentMethodSelect.addEventListener("change", function () {
        const selectedOption = paymentMethodSelect.options[paymentMethodSelect.selectedIndex];
        accountNumberInput.value = selectedOption.value || "";
        accountNameInput.value = selectedOption.getAttribute("data-account-name") || "";
    });
});
</script>




</body>

</html>
