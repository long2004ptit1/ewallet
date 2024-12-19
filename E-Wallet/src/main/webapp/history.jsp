<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

	transition: .2s linear;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
	font-size: 15px;
}

h2 {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

.search-filters {
	display: flex;
	gap: 10px;
	margin-bottom: 20px;
}

.search-filters input, .search-filters select, .search-filters button {
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.search-filters select {
	padding-right: 30px;
}

.search-filters button {
	cursor: pointer;
	font-weight: bold;
}

.search-filters .btn-filter {
	background-color: #007bff;
	color: white;
}

.search-filters .btn-reset {
	background-color: #dc3545;
	color: white;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

table th, table td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: center;
}

table th {
	background-color: #f8f9fa;
	font-weight: bold;
}

.date-input {
	width: 150px;
		text-transform: none;
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

<body>

	<!-- Header placeholder -->
	<div class="header-space">
		<%@include file="all_component/header.jsp"%>
	</div>
</head>
	<div class="container">
		<h2>Lịch sử giao dịch</h2>
		<div class="search-filters">
			<input type="text" placeholder="Mã đơn" /> <input type="text"
				placeholder="Nội dung" /> <select>
				<option>Chọn loại</option>
				<option>Rút tiền</option>
				<option>Nạp tiền</option>
				<option>Chuyển tiền</option>
				<option>Nhận tiền</option>
			</select> 
			<input type="date" class="date-input" placeholder="DD/MM/YYYY" /> <input
				type="date" class="date-input" placeholder="DD/MM/YYYY" />
			<button class="btn-filter">Lọc</button>
			<button class="btn-reset">Bỏ lọc</button>
		</div>

		<table>
			<thead>
				<tr>
					<th>Mã giao dịch</th>
					<th>Trước GD</th>
					<th>Số tiền</th>
					<th>Sau GD</th>
					<th>Ngày tạo</th>
					<th>Loại giao dịch</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>12345</td>
					<td>10,000,000</td>
					<td>500,000</td>
					<td>9,500,000</td>
					<td>01/11/2024</td>
					<td>Rút tiền</td>
				</tr>
				<tr>
					<td>12346</td>
					<td>9,500,000</td>
					<td>1,000,000</td>
					<td>10,500,000</td>
					<td>02/11/2024</td>
					<td>Nạp tiền</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>
