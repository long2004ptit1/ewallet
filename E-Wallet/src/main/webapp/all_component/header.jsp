<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.UserDAOImpl"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>home</title>
	    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="all_component/header.css">
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
    padding: 3px 6px;
    border-radius: 5px;
    text-align: center;
    text-decoration: none;
    color: white;
    background-color: #f44336; /* Màu đỏ cho nút Đăng Xuất */
    margin-top: 5px; /* Khoảng cách bên trên */
    font-weight: bold;
    font-size: 10px; /* Giảm kích thước chữ */
}

.logout:hover {
    background-color: #bac34e; /* Màu khi di chuột qua */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Bóng đổ khi di chuột qua */
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
            <!-- Icon user -->
            <div id="user-icon" class="fas fa-user"></div>
            <!-- Hiển thị họ tên và số dư -->
            <div class="user-details">
                <span class="name">${userobj.name}</span>
                <span class="balance">Số dư: ${userobj.formattedBalance} Đ</span>
            </div>
			
        </div>	
        <span class="notification-icon fas fa-bell"></span>
         <a href="logout" class="logout"">Đăng xuất</a> 
    </c:if>

    <!-- Nếu chưa đăng nhập, hiển thị biểu tượng đăng nhập -->
    <c:if test="${empty userobj}">
        <div id="login-btn" class="fas fa-user"></div>
    </c:if>


</header>

</body>
</html>