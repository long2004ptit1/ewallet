<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->

    <link rel="stylesheet" href="all_component/style.css">
    <style type="text/css">
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




</style>

</head>
<body>
    
<!-- header section starts  -->

<header class="header">

    <a href="index.jsp" class="logo"> <i class='fas fa-wallet' style='font-size:36px'></i>  E-WALLET </a>

    <nav class="navbar">
        <a href="index.jsp">Trang chủ</a>
        <a href="transfer.jsp">Chuyển tiền</a>
        <a href="withdraw.jsp">Rút tiền</a>
        <a href="deposit.jsp">Nạp tiền</a>
        <a href="history.jsp">Lịch sử giao dịch</a>
        
        <a href="infor_user.jsp">Thông tin cá nhân</a>
    </nav>

    <div class="icons">
        <div id="search-btn" class="fas fa-search"></div>
        <div id="login-btn" class="fas fa-user"></div>
    </div>

    <form action="" class="search-form">
        <input type="search" placeholder="search here..." id="search-box">
        <label for="search-box" class="fas fa-search"></label>
    </form>


 	<c:if test="${not empty failMsg}">
				<h1 style="color:red;
    text-align: center;
    font-weight: bold; 
    position: fixed;
    top: 10%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 20px;">${failMsg}</h1>
				<c:remove var="failMsg" scope="session"/>
				</c:if>
	
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

        <img src="image/img.png" alt="" class="right-aligned-image"> 

            </div>
        </div>
       </div>

    

</section>


<!-- Chat Support Button and Chat Box -->
<div id="chat-container">
    <div id="chat-icon" onclick="toggleChat()">
        <i class="fas fa-comments"></i>
    </div>
    <div id="chat-box">
        <h3>Hỗ trợ nhanh</h3>
        <div id="chat-history"></div>
        <input type="text" id="chat-input" placeholder="Nhập tin nhắn..." />
        <button onclick="sendMessage()">Gửi</button>
    </div>
</div>



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

function toggleChat() {
    var chatBox = document.getElementById("chat-box");
    if (chatBox.style.display === "none" || chatBox.style.display === "") {
        chatBox.style.display = "block";
    } else {
        chatBox.style.display = "none";
    }
}

function sendMessage() {
    var message = document.getElementById("chat-input").value;
    var chatHistory = document.getElementById("chat-history");

    // Display the message in the chat history
    var messageElement = document.createElement("div");
    messageElement.textContent = "Bạn: " + message;
    chatHistory.appendChild(messageElement);

    // Clear the input
    document.getElementById("chat-input").value = "";

    // Auto-scroll to the bottom of the chat history
    chatHistory.scrollTop = chatHistory.scrollHeight;
}





</script>

</body>
</html>