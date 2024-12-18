<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.Map"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.TransactionDAOImpl"%>
<%@ page import="com.entity.User"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biểu đồ Dòng Tiền</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Highcharts Library -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <!-- Custom CSS -->
    <link rel="stylesheet" href="all_component/style.css">

    <style>
        body {
            background-color: #fff;
        }
        #cashFlowChart {
            width: 80%;
            margin: 20px auto;
            height: 500px;
        }
    </style>
    <!-- custom css file link  -->
    <link rel="stylesheet" href="all_component/style.css">
    <style>
    
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
    flex-direction: column; /* Sắp xếp tên và số dư theo cột */
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

.notification-icon {
    color: #FFD700; /* Màu vàng để biểu thị thông báo */
    font-size: 20px; /* Kích thước icon */
    margin-left: 5px; /* Khoảng cách giữa icon và tên */
    cursor: pointer; /* Con trỏ hiển thị như nút bấm */
}

.notification-icon:hover {
    color: #FFA500; /* Màu khi hover */
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
/* Right-aligned image class */
    .right-aligned-image {
        float: right;
        width: 300px; /* Adjust width as needed */
        height: 500px; /* Maintain aspect ratio */
        margin-left: 20px; /* Adds spacing on the left */
    }

body {
	background-color: #d0f5be; 
	}
	/* Right-aligned image class */
.right-aligned-image {
    float: right;
    width: 300px; /* Adjust width as needed */
    height: 500px; /* Maintain aspect ratio */
    margin-left: 20px; /* Adds spacing on the left */
}

/* Chat container styles */
h3{
font-size:20px;
}
#chat-container {
    position: fixed;
    bottom: 20px;
    right: 20px;
    z-index: 1000;
}

/* Chat icon button */
#chat-icon {
    width: 50px;
    height: 50px;
    background-color: #4CAF50;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    color: white;
    font-size: 24px;
}

/* Chat box styles */
#chat-box {
    display: none;
    width: 300px;
    background-color: white;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    padding: 10px;
    border-radius: 5px;
    margin-top: 10px;
}

/* Chat history and input */
#chat-history {
    height: 200px;
    overflow-y: auto;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    padding: 5px;
    font-size: 16px;
}

#chat-input {
    width: 100%;
    padding: 5px;
    margin-top: 5px;
    font-size: 16px;
}

/* Style and effect for the send button */
#chat-box button {
    padding: 10px 20px;
    font-size: 12px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease; /* Hiệu ứng chuyển màu và phóng to */
}

/* Hover effect */
#chat-box button:hover {
    background-color: #45a049; /* Thay đổi màu nền khi hover */
    transform: scale(1.05); /* Phóng to nhẹ khi hover */
}

/* Active effect */
#chat-box button:active {
    transform: scale(0.95); /* Thu nhỏ nhẹ khi nhấn vào */
}

/*Thiết Kế của Chart */
body {
            margin-top: 100px;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
            justify-content: center;
        }

        .box {
            width: 48%;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 15px;
            text-align: center;
        }

        .box h3 {
            margin-bottom: 10px;
            color: #333;
        }

        .chart-container {
            width: 100%;
            height: 300px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .box {
                width: 100%;
            }
        }
    
    </style>
</head>
<body>

<!-- header section starts  -->

<header class="header">

    <a href="home.jsp" class="logo"> <i class='fas fa-wallet' style='font-size:36px'></i>  E-WALLET </a>

    <nav class="navbar">
        <a href="home.jsp">Trang chủ</a>
        <a href="transfer.jsp">Chuyển tiền</a>
        <a href="withdraw.jsp">Rút tiền</a>
        <a href="deposit.jsp">Nạp tiền</a>
        <a href="history.jsp">Lịch sử giao dịch</a>
        <a href="infor_user.jsp">Thông tin cá nhân</a>
    </nav>


    <!-- Kiểm tra và hiển thị thông tin người dùng đã đăng nhập -->
    <c:if test="${not empty userobj}">
        <div class="user-info">

            <div id="user-icon" class="fas fa-user"></div>

            <div class="user-details">
                <span class="name">${userobj.name}</span>
                 
                <span class="balance">Số dư: ${userobj.formattedBalance} Đ</span>
            </div>
        </div>
        <span class="notification-icon fas fa-bell"></span>
 <a href="logout" class="logout"">Đăng xuất</a> 
    </c:if>
</header>

<%
    // Lấy thông tin user từ session
    User user = (User) session.getAttribute("userobj");
    int userId = user != null ? user.getId() : -1;

    // Lấy dữ liệu dòng tiền từ DAO
    TransactionDAOImpl transactionDAO = new TransactionDAOImpl(DBConnect.getConn());
    Map<String, Double[]> cashFlow = userId > 0 ? transactionDAO.getMonthlyCashFlowByUser(userId) : null;
%>

<!-- Dashboard Layout -->
<div class="container">
    <!-- Biểu đồ 1 -->
    <div class="box">
        <h3>Biểu Đồ Dòng Tiền</h3>
        <div id="chart1" class="chart-container"></div>
    </div>

    <!-- Biểu đồ 2 -->
    <div class="box">
        <h3>Biểu Đồ Tổng Dòng Tiền</h3>
        <div id="chart2" class="chart-container"></div>
    </div>
</div>

<!-- Script Highcharts -->
<script>
    const months = [];
    const inflowData = [];
    const outflowData = [];

    <% if (cashFlow != null) { %>
        <% for (Map.Entry<String, Double[]> entry : cashFlow.entrySet()) { %>
            months.push('<%= entry.getKey() %>');
            inflowData.push(<%= entry.getValue()[0] %>); // Dòng tiền vào
            outflowData.push(<%= entry.getValue()[1] %>); // Dòng tiền ra
        <% } %>
    <% } %>

    // Biểu Đồ Dòng Tiền
    Highcharts.chart('chart1', {
        chart: { type: 'column' },
        title: { text: 'Dòng Tiền Vào và Ra Theo Tháng' },
        xAxis: { categories: months, title: { text: 'Tháng' } },
        yAxis: { title: { text: 'Số Tiền (VND)' } },
        tooltip: {
            shared: true,
            headerFormat: '<b>{point.key}</b><br>',
            pointFormat: '{series.name}: {point.y} VND<br/>Tổng: {point.stackTotal} VND'
        },
        plotOptions: { column: { stacking: 'normal' } },
        series: [
            { name: 'Dòng Tiền Vào', data: inflowData, color: '#2ecc71' },
            { name: 'Dòng Tiền Ra', data: outflowData, color: '#e74c3c' }
        ]
    });

    // Biểu Đồ Giả Định Khác
    Highcharts.chart('chart2', {
        chart: { type: 'line' },
        title: { text: 'Biểu Đồ Tổng Dòng Tiền' },
        xAxis: { categories: months },
        yAxis: { title: { text: 'Số Tiền (VND)' } },
        series: [{
            name: 'Dòng Tiền Tổng',
            data: inflowData.map((value, index) => value - outflowData[index] || 0),
            color: '#3498db'
        }]
    });
</script>

</body>
</html>
