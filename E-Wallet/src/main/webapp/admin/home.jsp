<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="allCss.jsp"%>
<style>
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}

.crd-ho:hover {
	background-color: #f0f1f2;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container mt-3">
		<h1 class="text-center">Hello,Admin</h1>
		<div class="row p-5">

			<div class="col-md-3">
				<a href="user_list.jsp">
					<div class="card crd-ho" style="height: 180px;">
						<div class="card-body text-center">
							<br> <i class="fas fa-plus-square fa-3x text-primary"></i>
							<h4>Danh sách người dùng</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="deposit_required.jsp">
					<div class="card crd-ho" style="height: 180px;">
						<div class="card-body text-center">
							<br> <i class="fa-solid fa-book-open fa-3x text-danger"></i>
							<h4>Yêu cầu nạp tiền</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="withdraw_required.jsp">
					<div class="card crd-ho" style="height: 180px;">
						<div class="card-body text-center">
							<br> <i class="fas fa-box-open fa-3x text-warning"></i>
							<h4>Yêu cầu rút tiền</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card crd-ho" style="height: 180px;">
						<div class="card-body text-center">
							<br> <i class="fas fa-box-open fa-3x text-warning"></i>
							<h4>Lịch sử giao dịch</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card crd-ho" style="height: 180px;">
						<div class="card-body text-center">
							<br> <i
								class="fa-solid fa-right-to-bracket fa-3x text-primary"></i>
							<h4>Logout</h4>
							-----------------
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<!--logout model-->
<%-- <div style="margin-top:200px;"><%@include file="footer.jsp"%></div> --%>
</body>
</html>