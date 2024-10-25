<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="all_component/header.css">
    

</head>
<body>
    
<!-- header section starts  -->

<header class="header">

    <a href="home.html" class="logo"> <i class="fas fa-shopping-basket"></i> E-WALLET </a>

    <nav class="navbar">
        <a href="home.html">Trang chủ</a>
        <a href="shop.html">Chuyển tiền</a>
        <a href="about.html">Rút tiền</a>
        <a href="review.html">Nạp tiền</a>
        <a href="blog.html">Lịch sử giao dịch</a>
        <a href="contact.html">Đầu tư</a>
        <a href="contact.html">Đổi mật khẩu</a>
    </nav>

    <div class="icons">
        <div id="search-btn" class="fas fa-search"></div>
        <div id="login-btn" class="fas fa-user"></div>
    </div>

    <form action="" class="search-form">
        <input type="search" placeholder="search here..." id="search-box">
        <label for="search-box" class="fas fa-search"></label>
    </form>


<!--     <form action="" class="login-form">
        <h3>login form</h3>
        <input type="email" placeholder="enter your email" class="box">
        <input type="password" placeholder="enter your password" class="box">
        <div class="remember">
            <input type="checkbox" name="" id="remember-me">
            <label for="remember-me">remember me</label>
        </div>
        <input type="submit" value="login now" class="btn">
        <p>forget password? <a href="#">click here</a></p>
        <p>don't have an account? <a href="#">create one</a></p>
    </form> -->

</header>
<script>
let searchForm = document.querySelector('.search-form');

let loginForm = document.querySelector('.login-form');
let navbar = document.querySelector('.navbar');

// Hiển thị form tìm kiếm
document.querySelector('#search-btn').onclick = () => {
    searchForm.classList.toggle('active');

    loginForm.classList.remove('active');
    navbar.classList.remove('active');
}


// Hiển thị form đăng nhập
document.querySelector('#login-btn').onclick = () => {
    loginForm.classList.toggle('active');
    searchForm.classList.remove('active');
    cart.classList.remove('active');
    navbar.classList.remove('active');
}

// Hiển thị menu
document.querySelector('#menu-btn').onclick = () => {
    navbar.classList.toggle('active');
    searchForm.classList.remove('active');
    cart.classList.remove('active');
    loginForm.classList.remove('active');
}

// Đóng các form khi cuộn trang
window.onscroll = () => {
    searchForm.classList.remove('active');
    cart.classList.remove('active');
    loginForm.classList.remove('active');
    navbar.classList.remove('active');
}

// Trình chiếu slide
let slides = document.querySelectorAll('.home .slides-container .slide');
let index = 0;

function next() {
    slides[index].classList.remove('active');
    index = (index + 1) % slides.length;
    slides[index].classList.add('active');
}

function prev() {
    slides[index].classList.remove('active');
    index = (index - 1 + slides.length) % slides.length;
    slides[index].classList.add('active');
}

</script>
</body>
</html>