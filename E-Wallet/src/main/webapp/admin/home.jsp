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
    <title>home</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="style.css">
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

    
    </style>

</head>
<body>
    
<!-- header section starts  -->

<header class="header">

    <a href="home.jsp" class="logo"> <i class='fas fa-wallet' style='font-size:36px'></i>  E-WALLET </a>

    <nav class="navbar">
        <a href="home.jsp">Trang chủ</a>
        <a href="user_list.jsp">DS người dùng</a>
        <a href="admin_list.jsp">DS admin</a>
        <a href="deposit_requests.jsp">YC Nạp tiền</a>
        <a href="withdraw_requests.jsp">YC Rút tiền</a>
        <a href="infor_user.jsp">Lịch sử</a>
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
 <a href="${pageContext.request.contextPath}/logout" class="logout"">Đăng xuất</a> <!-- lấu đường dẫn gốc -->
    </c:if>

    <!-- Nếu chưa đăng nhập, hiển thị biểu tượng đăng nhập -->
    <c:if test="${empty userobj}">
        
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
        
        <input type="email" placeholder="Nhập tên đăng nhập " class="box" required name="email">
        <input type="password" placeholder="Nhập mật khẩu" class="box" required name="password">
        <div class="remember">
            <input type="checkbox" name="" id="remember-me">
            <label for="remember-me">Nhớ mật khẩu</label>
        </div>
        <input type="submit" value="Đăng nhập" class="btn">
        <p>Quên mật khẩu? <a href="forgetpassword.jsp">Lấy lại</a></p>
        <p>Bạn chưa có tài khoản? <a href="register.jsp">Đăng ký</a></p>
    </form>
        
    </c:if>


        


</header>

<!-- header section ends -->

<section class="home">

    <div class="slides-container">

        <div class="slide active">
            <div class="content">
                <span>fresh and organic</span>
                <h3>upto 50% off</h3>
                <a href="#" class="btn">shop now</a>
            </div>
            <div class="image">
                <img src="image/home-img-1.png" alt="">
            </div>
        </div>

        <div class="slide">
            <div class="content">
                <span>fresh and organic</span>
                <h3>upto 50% off</h3>
                <a href="#" class="btn">shop now</a>
            </div>
            <div class="image">
                <img src="image/home-img-2.png" alt="">
            </div>
        </div>

        <div class="slide">
            <div class="content">
                <span>fresh and organic</span>
                <h3>upto 50% off</h3>
                <a href="#" class="btn">shop now</a>
            </div>
            <div class="image">
                <img src="image/home-img-3.png" alt="">
            </div>
        </div>

    </div>

    <div id="next-slide" class="fas fa-angle-right" onclick="next()"></div>
    <div id="prev-slide" class="fas fa-angle-left" onclick="next()"></div>

</section>





<script>

let searchForm = document.querySelector('.search-form');

document.querySelector('#search-btn').onclick = () =>{
    searchForm.classList.toggle('active');
    cart.classList.remove('active');
    loginForm.classList.remove('active');
    navbar.classList.remove('active');
}

let loginForm = document.querySelector('.login-form');

document.querySelector('#login-btn').onclick = () =>{
    loginForm.classList.toggle('active');
    searchForm.classList.remove('active');
    cart.classList.remove('active');
    navbar.classList.remove('active');
}

let navbar = document.querySelector('.navbar');

document.querySelector('#menu-btn').onclick = () =>{
    navbar.classList.toggle('active');
    searchForm.classList.remove('active');
    cart.classList.remove('active');
    loginForm.classList.remove('active');
}

window.onscroll = () =>{
    searchForm.classList.remove('active');
    cart.classList.remove('active');
    loginForm.classList.remove('active');
    navbar.classList.remove('active');
}

let slides = document.querySelectorAll('.home .slides-container .slide');
let index = 0;

function next(){
    slides[index].classList.remove('active');
    index = (index + 1) % slides.length;
    slides[index].classList.add('active');
}

function prev(){
    slides[index].classList.remove('active');
    index = (index - 1 + slides.length) % slides.length;
    slides[index].classList.add('active');
}</script>

</body>
</html>