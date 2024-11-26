<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.entity.Transaction"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.TransactionDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch sử nhận tiền</title>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;300;400;500;600&display=swap");

        * {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #f9f9f9;
            color: #333;
            line-height: 1.6;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #4CAF50;
        }

        .history-table table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .history-table th, .history-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .history-table th {
            background-color: #4CAF50;
            color: white;
        }

        .history-table td {
            background-color: #f9f9f9;
        }

        .navigation {
            margin-bottom: 20px;
            text-align: center;
        }

        .navigation a {
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
            margin: 0 10px;
        }

        .navigation a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Lịch sử nhận tiền</h1>

        <!-- Điều hướng giữa lịch sử chuyển tiền và nhận tiền -->
        <div class="navigation">
            <a href="history-transfer.jsp">Lịch sử chuyển tiền</a> |
            <a href="history-received.jsp">Lịch sử nhận tiền</a>
        </div>

        <!-- Bảng lịch sử nhận tiền -->
        <div class="history-table">
            <table>
                <thead>
                    <tr>
                        <th>Mã giao dịch</th>
                        <th>Số tiền</th>
                        <th>Người gửi</th>
                        <th>Tên người gửi</th>
                        <th>Thời gian</th>
                        <th>Trạng thái</th>
                        <th>Nội dung</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Tạo đối tượng DAO
                        TransactionDAOImpl transactionDao = new TransactionDAOImpl(DBConnect.getConn());

                        // Lấy người dùng từ session
                        User receiver = (User) session.getAttribute("userobj");

                        // Lấy danh sách giao dịch nhận tiền
                        List<Transaction> receivedTransactions = transactionDao.getReceivedTransactions(receiver.getId());

                        // Kiểm tra danh sách giao dịch nhận tiền
                        if (receivedTransactions != null && !receivedTransactions.isEmpty()) {
                            for (Transaction transaction : receivedTransactions) {
                    %>
                    <tr>
                        <td><%=transaction.getTransactionId()%></td>
                        <td style="color: green">+ <%=transaction.getFormattedAmount()%> VND</td>
                        <td><%=transaction.getSenderUserName()%></td>
                        <td><%=transaction.getSenderName()%></td>
                        <td><%=transaction.getTransactionDate()%></td>
                        <td><%=transaction.getStatus()%></td>
                        <td><%=transaction.getMessage() != null ? transaction.getMessage() : "Không có mô tả"%></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="7" style="text-align: center;">Chưa có giao dịch nhận tiền nào.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>
