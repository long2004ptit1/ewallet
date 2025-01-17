<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.UserDAOImpl"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home</title>

    <!-- font awesome cdn link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link -->
    <link rel="stylesheet" href="style.css">
    <style>
/* CSS styling cho giao diện */
.user-info {
    display: flex;
    align-items: center;
    gap: 10px;
    background-color: #4CAF50;
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
    font-weight: bold;
    white-space: nowrap;
}

.user-info .user-details {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}

.user-info #user-icon {
    font-size: 20px;
}

.user-info .name {
    font-size: 15px;
}

.user-info .balance {
    font-size: 14px;
    color: #dcdcdc;
}

/* Nút đăng xuất */
.logout {
    padding: 5px 10px;
    border-radius: 5px;
    text-align: center;
    text-decoration: none;
    color: white;
    background-color: #f44336;
    margin-top: 5px; 
    font-weight: bold;																		
}

.logout:hover {
    background-color: #bac34e; 
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
}

body {
	background-color: #d0f5be; 
}

/* Phần biểu đồ */
.charts {
    margin: 40px 0;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: left ;
    margin-top: 150px;
}

canvas {
    margin: 0 auto;
}

.charts-container {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 20px;
    margin-top: 30px;
}

.chart {
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
    box-sizing: border-box;
}


    </style>
</head>
<body>
    
<!-- Header section -->
<header class="header">

    <a href="home.jsp" class="logo"> <i class='fas fa-wallet' style='font-size:36px'></i>  E-WALLET </a>

    <nav class="navbar">
        <a href="home.jsp">Trang chủ</a>
        <a href="admin_list.jsp">DS admin</a>
        <a href="user_list.jsp">DS khách hàng</a>
        <a href="deposit_requests.jsp">YC Nạp tiền</a>
        <a href="withdraw_requests.jsp">YC Rút tiền</a>
        <a href="history.jsp">Lịch sử giao dịch</a>
    </nav>

    <c:if test="${not empty admin}">
        <div class="user-info">
            <div id="user-icon" class="fas fa-user"></div>
            <div class="user-details">
                <span class="name">ADMIN</span>
            </div>
        </div>
        <a href="${pageContext.request.contextPath}/logout" class="logout">Đăng xuất</a>
    </c:if>

    <c:if test="${empty admin}">
        <div class="icons">
            <div id="search-btn" class="fas fa-search"></div>
            <div id="login-btn" class="fas fa-user"></div>
        </div>
        <form action="" class="search-form">
            <input type="search" placeholder="search here..." id="search-box">
            <label for="search-box" class="fas fa-search"></label>
        </form>
        <form action="login" class="login-form" method="post">
            <h3>Đăng nhập</h3>
            <input type="email" placeholder="Nhập tên đăng nhập" class="box" required name="email">
            <input type="password" placeholder="Nhập mật khẩu" class="box" required name="password">
            <div class="remember">
                <input type="checkbox" id="remember-me">
                <label for="remember-me">Nhớ mật khẩu</label>
            </div>
            <input type="submit" value="Đăng nhập" class="btn">
            <p>Quên mật khẩu? <a href="forgetpassword.jsp">Lấy lại</a></p>
            <p>Bạn chưa có tài khoản? <a href="register.jsp">Đăng ký</a></p>
        </form>
    </c:if>
</header>

<!-- Home section -->
 <section class="charts">
   
<!-- Import thư viện Highcharts -->
<script src="https://code.highcharts.com/highcharts.js"></script>

<!-- Thẻ chứa biểu đồ -->

    <div class="chart" id="transactions-chart" style="width: 40%; height: 400px;"></div>
  



<script src="https://code.highcharts.com/highcharts.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function () {
    fetch('${pageContext.request.contextPath}/TransactionTypeStats')
        .then(response => response.json())
        .then(data => {
            // Hợp nhất và sắp xếp các tháng từ tất cả các loại giao dịch
            const months = Array.from(new Set([
                ...Object.keys(data.transactions),
                ...Object.keys(data.deposit),
                ...Object.keys(data.withdraw)
            ])).sort();

            // Chuẩn hóa dữ liệu để đảm bảo mọi tháng đều có giá trị
            const transactionData = months.map(month => data.transactions[month] || 0);
            const depositData = months.map(month => data.deposit[month] || 0);
            const withdrawData = months.map(month => data.withdraw[month] || 0);

            // Hiển thị biểu đồ
            Highcharts.chart('transactions-chart', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Số lượng giao dịch theo loại',
                    align: 'left'
                },
                xAxis: {
                    categories: months,
                    title: { text: 'Tháng' }
                },
                yAxis: {
                    allowDecimals: false,
                    min: 0,
                    title: {
                        text: 'Số lượng giao dịch'
                    }
                },
                tooltip: {
                    formatter: function () {
                        return '<b>' + this.key + '</b><br/>' +
                            this.series.name + ': ' + this.y + '<br/>' +
                            'Tổng cộng: ' + this.point.stackTotal;
                    }
                },
                plotOptions: {
                    column: {
                        stacking: 'normal'
                    }
                },
                series: [
                    {
                        name: 'Transaction',
                        data: transactionData,
                        stack: 'Transaction'
                    },
                    {
                        name: 'Deposit',
                        data: depositData,
                        stack: 'Transaction'
                    },
                    {
                        name: 'Withdraw',
                        data: withdrawData,
                        stack: 'Transaction'
                    }
                ]
            });
        })
        .catch(error => {
            console.error('Lỗi khi tải dữ liệu:', error);
        });
});
</script>



</body>
</html>