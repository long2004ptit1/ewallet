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
    <link rel="stylesheet" href="all_component/style.css">

</head>
<body>
    
<!-- header section starts  -->

<header class="header">

    <a href="index.jsp" class="logo"> <i class="fas fa-shopping-basket"></i> E-WALLET </a>

    <nav class="navbar">
        <a href="index.jsp">Trang chủ</a>
        <a href="transfer.jsp">Chuyển tiền</a>
        <a href="withdraw.jsp">Rút tiền</a>
        <a href="deposit.jsp">Nạp tiền</a>
        <a href="history.jsp">Lịch sử giao dịch</a>
        <a href="contact.html">Đầu tư</a>
        <a href="changepassword.jsp">Đổi mật khẩu</a>
    </nav>

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

<section class="banner-container">

    <div class="banner">
        <img src="image/banner-1.jpg" alt="">
        <div class="content">
            <span>limited sales</span>
            <h3>upto 50% off</h3>
            <a href="#" class="btn">shop now</a>
        </div>
    </div>

    <div class="banner">
        <img src="image/banner-2.jpg" alt="">
        <div class="content">
            <span>limited sales</span>
            <h3>upto 50% off</h3>
            <a href="#" class="btn">shop now</a>
        </div>
    </div>

    <div class="banner">
        <img src="image/banner-3.jpg" alt="">
        <div class="content">
            <span>limited sales</span>
            <h3>upto 50% off</h3>
            <a href="#" class="btn">shop now</a>
        </div>
    </div>

</section>





















<!-- footer section starts  -->

<section class="footer">

    <div class="box-container">

        <div class="box">
            <h3>quick links</h3>
            <a href="home.html"> <i class="fas fa-arrow-right"></i> home</a>
            <a href="shop.html"> <i class="fas fa-arrow-right"></i> shop</a>
            <a href="about.html"> <i class="fas fa-arrow-right"></i> about</a>
            <a href="review.html"> <i class="fas fa-arrow-right"></i> review</a>
            <a href="blog.html"> <i class="fas fa-arrow-right"></i> blog</a>
            <a href="contact.html"> <i class="fas fa-arrow-right"></i> contact</a>
        </div>

        <div class="box">
            <h3>extra links</h3>
            <a href="#"> <i class="fas fa-arrow-right"></i> my order </a>
            <a href="#"> <i class="fas fa-arrow-right"></i> my favorite </a>
            <a href="#"> <i class="fas fa-arrow-right"></i> my wishlist </a>
            <a href="#"> <i class="fas fa-arrow-right"></i> my account </a>
            <a href="#"> <i class="fas fa-arrow-right"></i> terms or use </a>
        </div>

        <div class="box">
            <h3>follow us</h3>
            <a href="#"> <i class="fab fa-facebook-f"></i> facebook </a>
            <a href="#"> <i class="fab fa-twitter"></i> twitter </a>
            <a href="#"> <i class="fab fa-instagram"></i> instagram </a>
            <a href="#"> <i class="fab fa-linkedin"></i> linkedin </a>
            <a href="#"> <i class="fab fa-pinterest"></i> pinterest </a>
        </div>

        <div class="box">
            <h3>newsletter</h3>
            <p>subscribe for latest updates</p>
            <form action="">
                <input type="email" placeholder="enter your email">
                <input type="submit" value="subscribe" class="btn">
            </form>
            <img src="image/payment.png" class="payment" alt="">
        </div>

    </div>

</section>

<section class="credit">created by mr. web designer | all rights reserved!</section>

<!-- footer section ends -->













<!-- custom css file link  -->
<script>let searchForm = document.querySelector('.search-form');

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