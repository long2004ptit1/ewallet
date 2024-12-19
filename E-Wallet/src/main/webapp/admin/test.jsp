<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Báo cáo Người Dùng</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
}

h1 {
	text-align: center;
	margin-bottom: 30px;
}

.report-section {
	margin: 20px auto;
	padding: 20px;
	width: 90%;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #f9f9f9;
}

.report-section h2 {
	margin-bottom: 20px;
	color: #333;
}

.summary {
	display: flex;
	justify-content: space-around;
	margin-bottom: 20px;
}

.summary-item {
	width: 25%;
	text-align: center;
	padding: 15px;
	background-color: #f2f2f2;
	border-radius: 5px;
}

.summary-item h3 {
	margin: 10px 0;
}

.summary-item p {
	font-size: 20px;
	color: #555;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 10px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

.empty-data {
	text-align: center;
	color: red;
	font-size: 18px;
	margin-top: 20px;
}
</style>
</head>
<body>

	<div class="header-space">
		<%@include file="header.jsp"%>
	</div>
	<h1>Báo Cáo Người Dùng</h1>

	<!-- Phần tóm tắt -->
	<div class="report-section">
		<h2>Tóm Tắt</h2>
		<div class="summary">
			<div class="summary-item">
				<h3>Tổng số người dùng</h3>
				<p>1,250</p>
				<!-- Dữ liệu mẫu -->
			</div>
			<div class="summary-item">
				<h3>Người dùng mới (30 ngày gần nhất)</h3>
				<p>150</p>
				<!-- Dữ liệu mẫu -->
			</div>
			<div class="summary-item">
				<h3>Số dư trung bình</h3>
				<p>2,500,000 VNĐ</p>
				<!-- Dữ liệu mẫu -->
			</div>
		</div>
	</div>

	<!-- Người giao dịch nhiều nhất -->
	<div class="report-section">
		<h2>Người Dùng Giao Dịch Nhiều Nhất</h2>
		<table>
			<thead>
				<tr>
					<th>ID Người Dùng</th>
					<th>Tên</th>
					<th>Email</th>
					<th>Số Lượng Giao Dịch</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>101</td>
					<td>Nguyễn Văn A</td>
					<td>nguyenvana@example.com</td>
					<td>120</td>
					<!-- Dữ liệu mẫu -->
				</tr>
				<tr>
					<td>102</td>
					<td>Trần Thị B</td>
					<td>tranthib@example.com</td>
					<td>110</td>
					<!-- Dữ liệu mẫu -->
				</tr>
			</tbody>
		</table>
	</div>

	</div>
</body>
</html>
