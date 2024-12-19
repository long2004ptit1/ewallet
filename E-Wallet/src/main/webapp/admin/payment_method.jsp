<%@page import="com.DAO.PaymentMethodDAOimpl"%>
<%@ page import="com.entity.PaymentMethod" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Cổng Thanh Toán</title>
    <style>
        h2 {
        margin-top:100px;
            padding: 20px;
            font-size: 20px;
        }

        .history-table {
            margin-top: 20px;
            margin-left: 30px;
        }

        .history-table table {
            width: 80%;
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

        /* Button styles */
        .button {
            font-size: 14px;
            font-weight: bold;
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            color: white;
        }

        .btn-approve {
            background-color: #4CAF50;
        }

        .btn-approve:hover {
            background-color: #45a049;
        }

        .btn-reject {
            background-color: #f44336;
        }

        .btn-reject:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
<!-- Header placeholder -->
<div class="header-space">
    <%@include file="header.jsp"%>
</div>

<h2>Danh Sách Cổng Thanh Toán</h2>
 <!-- Hiển thị thông báo -->
    <c:if test="${not empty succMsg}">
        <div class="message success">${succMsg}</div>
        <c:remove var="succMsg" scope="session"/>
    </c:if>
    <c:if test="${not empty failMsg}">
        <div class="message error">${failMsg}</div>
        <c:remove var="failMsg" scope="session"/>
    </c:if>
<div class="history-table">
    <table>
        <thead>
            <tr>
                <th>Số Tài Khoản</th>
                <th>Tên Ngân Hàng</th>
                <th>Tên Chủ Tài Khoản</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Khai báo đối tượng PaymentMethodDAOImpl để truy xuất dữ liệu
                PaymentMethodDAOimpl dao = new PaymentMethodDAOimpl(DBConnect.getConn());
                
                // Lấy danh sách phương thức thanh toán từ cơ sở dữ liệu
                List<PaymentMethod> list = dao.getAllPaymentMethod(); 

                // Duyệt qua danh sách và hiển thị từng phương thức thanh toán
                for (PaymentMethod paymentMethod : list) {
            %>
                <tr>
                    <td><%= paymentMethod.getAccountNumber() %></td>
                    <td><%= paymentMethod.getName() %></td>
                    <td><%= paymentMethod.getAccountName() %></td>
                    <!-- Nút Chỉnh Sửa -->
                    <td>
                        <a href="edit_paymentMethod.jsp?account_number=<%= paymentMethod.getAccountNumber() %>" 
                           class="button btn-approve">Chỉnh Sửa</a>

                    <!-- Nút Xóa -->
                        <a href="../deletePaymentMethod?accountNumber=<%= paymentMethod.getAccountNumber() %>" 
                           class="button btn-reject"
                           onclick="return confirm('Bạn có chắc chắn muốn xóa phương thức này không?');">Xóa</a>
                    </td>
                </tr>
            <% 
                }
            %>
        </tbody>
    </table>

    <!-- Nút Thêm Phương Thức -->
    <div style="margin-top: 20px; text-align: center;">
        <a href="add_payment_method.jsp" class="button btn-approve">Thêm Mới</a>
    </div>
</div>

</body>
</html>
