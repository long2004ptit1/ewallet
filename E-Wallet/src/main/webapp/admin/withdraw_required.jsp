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
			<h2>Yêu cầu rút tiền</h2>
			<table>
			<thead>
				<tr>
										<th>Mã đơn</th>
					<th>Tên đăng nhập</th>
					<th>Số tiền rút</th>
					<th>Cổng thanh toán</th>
					<th>Thời gian</th>
					<th>Trạng thái</th>

				</tr>
				</thead>
				<tbody>
				<tr>
				                    <td>ABCD123</td>
                    <td>long2004ptit</td>

                    <td>100.000</td>
                    <td>Techcombank</td>
                    <td>25/10/2024 10:40:54</td>
                    
					<td><a href="" class="btn btn-sm btn-primary">Xác nhận</a> <a
				href="#" class="btn btn-sm btn-danger">Hủy</a></td>
                </tr>
				</tbody>
				<!-- Add history rows here -->
			</table>
		</div>
</body>
</html>