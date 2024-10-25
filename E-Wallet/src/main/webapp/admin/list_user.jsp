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
			<h2>Danh sách người dùng</h2>
			<table>
			<thead>
				<tr>
					<th>Tên đăng nhập</th>
					<th>Họ tên</th>
					<th>Email</th>
					<th>Mật khẩu</th>
					<th>Số dư</th>
					<th>Mô tả</th>
				</tr>
				</thead>
				<tbody>
				<tr>
				                    <td>long2004ptit</td>
                    <td>Vũ Thành Long</td>

                    <td>long2004ptit@gmail.com</td>
                    <td>22022004</td>
                    <td>100,000đ</td>
					<td><a href="" class="btn btn-sm btn-primary">Chỉnh sửa</a> <a
				href="#" class="btn btn-sm btn-danger">Xóa</a></td>
                </tr>
				</tbody>
				<!-- Add history rows here -->
			</table>
		</div>
</body>
</html>