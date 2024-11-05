<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.entity.Transaction"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.TransactionDAOImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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

/* Cỡ chữ tiêu đề "Chuyển Tiền" */
h1 {
	font-size: 32px; /* Tăng cỡ chữ của tiêu đề */
	text-align: center;
	margin-bottom: 20px;
}

.transfer-form {
	padding: 20px;
	border: 1px solid #ddd;
	background-color: #fff;
	display: flex;
	justify-content: space-between;
}

.form-left, .form-right {
	width: 48%;
}

/* Tăng cỡ chữ cho các nhãn */
.form-left label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
	font-size: 18px; /* Tăng cỡ chữ của nhãn */
}

/* Cỡ chữ cho các trường nhập liệu */
.form-left input, .form-left select, .form-left textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px; /* Tăng cỡ chữ của input */
}

#receiver {
	text-transform: none;
}

/* Tăng cỡ chữ cho nút "Chuyển tiền" */
.form-left button {
	width: 100%;
	padding: 15px;
	background-color: #4CAF50;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 18px; /* Tăng cỡ chữ của nút */
	font-weight: bold;
}

.form-left button:hover {
	background-color: #f1c40f;
}

/* Tăng cỡ chữ cho bảng bên phải */
.form-right th, .form-right td {
	padding: 10px;
	text-align: left;
	font-size: 16px; /* Tăng cỡ chữ cho bảng */
	border: 1px solid #ddd;
}

.form-right th {
	background-color: #f2f2f2;
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

		<h1>Chuyển tiền</h1>
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
		<div class="transfer-form">
			<div class="form-left">
				<form action="transfer" method="post">
					<label for="account">Chọn quỹ</label> <select id="account">
						<option value="vnd">Tài khoản ví -
							${userobj.formattedBalance}đ</option>
					</select> <label for="receiver">Tài khoản nhận</label> <input type="text"
						id="receiver"
						placeholder="Nhập email hoặc số điện thoại hoặc username"
						name="receiver"> <label for="receiver-name">Tên
						người nhận</label> <input type="text" id="receiver-name" disabled
						name="receiver_name"> <label for="amount">Số tiền</label>
					<input type="number" id="amount" placeholder="₫" name="amount"
						required min="1000"> <label for="message">Nội dung
						chuyển</label>
					<textarea id="message" rows="3" placeholder="Nội dung chuyển"
						name="message"></textarea>

					<button type="submit">Chuyển tiền</button>
				</form>
			</div>

			<div class="form-right">
				<table>
					<tr>
						<th>Loại</th>
						<th>VND</th>
					</tr>
					<tr>
						<td>Phí cố định</td>
						<td>0VND</td>
					</tr>

					<tr>
						<td>Tổng chuyển tối đa trong ngày</td>
						<td>Không giới hạn</td>
					</tr>
					<tr>
						<td>Số tiền chuyển tối thiểu</td>
						<td>1,000 VND</td>
					</tr>
					<tr>
						<td>Số tiền chuyển tối đa</td>
						<td>20,000,000 VND</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="history-table">
			<h2>Lịch sử chuyển tiền</h2>
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


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $('#receiver').on('input', function() {
        var receiverInput = $(this).val();
        if (receiverInput.length > 0) {
            $.ajax({
                url: 'getReceiverName', // URL tới servlet để lấy tên người nhận
                type: 'GET',
                data: { username: receiverInput }, // Gửi tên tài khoản nhận
                success: function(response) {
                    // Nếu có kết quả trả về
                    if (response === "Tài khoản không tồn tại") {
                        $('#receiver-name').val(response); 
                    } else {
                        // Nếu có tên người nhận, cập nhật ô tên người nhận
                        $('#receiver-name').val(response);
                    }
                },
                error: function() {
                    console.log('Error retrieving receiver name.');
                }
            });
        } else {
            $('#receiver-name').val(''); // Nếu ô rỗng, xóa ô tên người nhận
        }
    });
});
</script>

</body>

</html>
