<%@page import="com.DAO.PaymentMethodDAOimpl"%>
<%@ page import="com.entity.PaymentMethod" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Phương Thức Thanh Toán</title>
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

<h2>Danh Sách Phương Thức Thanh Toán</h2>

<div class="history-table">
    <table>
        <thead>
            <tr>
                <th>Số Tài Khoản</th>
                <th>Tên Ngân Hàng</th>
                <th>Tên Chủ Tài Khoản</th>
                <th>Chỉnh Sửa</th>
                <th>Xóa</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Khai báo đối tượng PaymentMethodDAOImpl để truy xuất dữ liệu
                PaymentMethodDAOimpl dao = new PaymentMethodDAOimpl();
                
                // Lấy danh sách phương thức thanh toán từ cơ sở dữ liệu
                List<PaymentMethod> list = dao.getAllPaymentMethod(); 

                // Duyệt qua danh sách và hiển thị từng phương thức thanh toán
                for (PaymentMethod paymentMethod : list) {
            %>
                <tr>
                    <td><%= paymentMethod.getAccountnumber() %></td>
                    <td><%= paymentMethod.getName() %></td>
                    <td><%= paymentMethod.getAccountname() %></td>
                    <!-- Nút Chỉnh Sửa -->
                    <td>
                        <a href="edit_payment_method.jsp?accountnumber=<%= paymentMethod.getAccountnumber() %>" 
                           class="button btn-approve">Chỉnh Sửa</a>
                    </td>
                    <!-- Nút Xóa -->
                    <td>
                        <a href="DeletePaymentMethodServlet?account_number=<%= paymentMethod.getAccountnumber() %>" 
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
        <a href="add_payment_method.jsp" class="button btn-approve">Thêm Phương Thức</a>
    </div>
</div>

</body>
</html>
