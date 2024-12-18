
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
}

.history-table th {
	background-color: #f2f2f2;
}

.history-table {
	white-space: nowrap; /* Không ngắt dòng */
	width: 200px; /* Điều chỉnh chiều rộng theo ý muốn */
}

/*button  */
.button {
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
		<h2>Danh sách cổng thanh toán</h2>
		<table>
			<thead>
				<tr>
					<th>Tên ngân hàng</th>
					<th>Số tài khoản</th>
					<th>Chủ tài khoản</th>
				</tr>
			</thead>
			<tbody>

			</tbody>

			<tfoot>
				<tr>
					<td colspan="11" style="text-align: center;"><a
						href="add_product.jsp" class="button btn-approve"
						style="font-size: 16px; padding: 10px 20px;">Thêm mới</a></td>
				</tr>
			</tfoot>
			<!-- Add history rows here -->
		</table>
	</div>
</body>
</html>