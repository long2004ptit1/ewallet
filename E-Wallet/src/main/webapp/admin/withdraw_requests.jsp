<%@page import="com.entity.Withdraw"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.WithdrawDAOImpl"%>
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
	overflow: hidden; /* Ẩn nội dung tràn */
    white-space: nowrap; /* Ngăn ngừa ngắt dòng */
    text-overflow: ellipsis; /* Hiển thị dấu "..." nếu nội dung quá dài */
}

.history-table th {
	background-color: #f2f2f2;
}</style>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="history-table">
			<c:if test="${not empty successMessage}">
							<p style="color:green; text-align:center;font-weight: bold; font-size:20px;">${successMessage}</p>
		<c:remove var="successMessage" scope="session"/> <!-- xoa thong bao cu -->
						</c:if>
						
						<c:if test="${not empty errorMessage}">
							<p style="color:red; text-align:center;font-weight: bold; font-size:20px;">${errorMessage}</p>
							<c:remove var="errorMessage" scope="session"/> <!-- xoa thong bao cu -->
						</c:if>
			<h2>Yêu cầu rút tiền</h2>
			<table>
			<thead>
				<tr>
					<th>Mã đơn</th>
					<th>UserId</th>
					<th>Tên đăng nhập</th>
					<th>Số tiền rút</th>
					<th>Cổng thanh toán</th>
					<th>Số tài khoản</th>
					<th>Tên tài khoản</th>
					<th>Thời gian</th>
					<th>Trạng thái</th>
					<th>Thao tác</th>

				</tr>
				</thead>
<tbody>
<%
    // Khai báo DAO để lấy yêu cầu rút tiền
    WithdrawDAOImpl withdrawDao = new WithdrawDAOImpl(DBConnect.getConn());
    
    // Lấy danh sách yêu cầu rút tiền
    List<Withdraw> withdrawRequests = withdrawDao.getPendingRequests();
    
    // Kiểm tra nếu có yêu cầu rút tiền
    if (withdrawRequests != null && !withdrawRequests.isEmpty()) {
        // Hiển thị từng yêu cầu rút tiền
        for (Withdraw req : withdrawRequests) {
%>
            <tr>
                <td><%= req.getTransactionId() %></td>
                <td><%= req.getUserId() %></td>
                 <td><%= req.getUserName() %></td>
                <td><%= req.getFormattedAmount() + " Đ" %></td> 
                <td><%= req.getPaymentMethod() %></td> 
                <td><%= req.getAccountNumber() %></td>
                <td><%= req.getAccountName() %></td>
                <td><%= req.getCreatedAt() != null ? req.getCreatedAt().toString() : "Không có thông tin" %></td> 
                <td><%= req.getStatus() %>
                <td>
                    <form action="../withdraw_requests" method="post" style="display:inline;">
                        <input type="hidden" name="transaction_id" value="<%= req.getTransactionId() %>">
                        <button type="submit" name="action" value="approve" class="btn btn-sm btn-primary">Xác nhận</button>
                    </form>
                    <form action="../withdraw_requests" method="post" style="display:inline;">
                        <input type="hidden" name="transaction_id" value="<%= req.getTransactionId() %>">
                        <button type="submit" name="action" value="reject" class="btn btn-sm btn-danger">Từ chối</button>
                    </form>
                </td>
            </tr>
<%
        }
    } else {
%>
        <tr>
            <td colspan="10" style="text-align:center;color:red;">Chưa có yêu cầu rút tiền nào.</td>
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