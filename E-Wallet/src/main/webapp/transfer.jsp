<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	line-height: 50px;
	font-size: 24px;
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
		<div class="transfer-form">
			<div class="form-left">
			<form action="transfer" method="post">
				<label for="account">Chọn quỹ</label> <select id="account">
					<option value="vnd">Tài khoản quỹ VND - 0đ</option>
				</select> <label for="receiver">Tài khoản nhận</label> 
				<input type="text" id="receiver" placeholder="Nhập email hoặc số điện thoại hoặc username">

				<label for="receiver-name">Tên người nhận</label> <input type="text"
					id="receiver-name" disabled> <label for="amount">Số
					tiền</label> <input type="number" id="amount" placeholder="₫"> <label
					for="message">Nội dung chuyển</label>
				<textarea id="message" rows="3" placeholder="Nội dung chuyển"></textarea>

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
						<td>10,000 VND</td>
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
				<tr>
					<th>Mã đơn</th>
					<th>Số tiền</th>
					<th>Tài khoản gửi/nhận</th>
					<th>Ngày tạo</th>
					<th>Trạng thái</th>
					<th>Mô tả</th>
				</tr>
				<!-- Add history rows here -->
			</table>
		</div>
	</div>

</body>

</html>
