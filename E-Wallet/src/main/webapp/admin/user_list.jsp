<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.UserDAOImpl"%>
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

}

.history-table {
    white-space: nowrap; /* Không ngắt dòng */
    width: 200px; /* Điều chỉnh chiều rộng theo ý muốn */
}

</style>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="history-table">
			<h2>Danh sách người dùng</h2>
			<table>
			<thead>
				<tr>
				<th>Id</th>
					
					<th>Họ tên</th>
					<th>Tên đăng nhập</th>
					<th>Email</th>
					<th>Số điện thoại</th>
					<th>Mật khẩu</th>
					<th>Số dư</th>
					<th>Thời gian tạo</th>
					<th>Mô tả</th>
				</tr>
				</thead>
				<tbody>
				<tr>
				       <%
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			List<User> list = dao.getAllUsers();
			for (User user : list) {
		%>
		<tr>
			<td><%=user.getId()%></td>
			<td><%=user.getName()%></td>
			<td><%=user.getUserName()%></td>
			<td><%=user.getEmail()%></td>
			<td><%=user.getPhone()%></td>
			<td><%=user.getPassword()%></td>
			<td><%= user.getFormattedBalance()+" VNĐ" %></td>
			 <td><%= user.getCreatedAt() %></td>
			<td><a href="" class="btn btn-sm btn-primary">Chỉnh sửa</a> <a
				href="#" class="btn btn-sm btn-danger">Xóa</a></td>


		</tr>
		<%
			}
		%>             
					
				</tbody>
				<!-- Add history rows here -->
			</table>
		</div>
</body>
</html>