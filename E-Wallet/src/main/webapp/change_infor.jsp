<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đổi thông tin cá nhân</title>

<style>
@import
    url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;300;400;500;600&display=swap")
    ;

* {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    outline: none;
    border: none;
    text-decoration: none;
    transition: .2s linear;
}

.container {
    max-width: 600px;
    margin: 50px auto;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 40px;
}

.container h2 {
    text-align: center;
    font-size: 24px;
    font-weight: bold;
    border-bottom: 2px solid #007bff;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    font-weight: bold;
    color: #333;
    font-size: 16px;
}

.form-group input {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-top: 8px;
}

.action-buttons {
    text-align: center;
    margin-top: 20px;
}

.action-buttons button {
    font-size: 16px;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    color: #fff;
}

.save-btn {
    background-color: #5cb85c;
}

.cancel-btn {
    background-color: #d9534f;
    margin-left: 10px;
}

/* Add space for header */
.header-space {
	height: 80px;
	background-color: #f1f1f1;
	text-align: center;
	line-height: 20px;
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}
</style>

</head>
<body>
<div class="header-space">
		<%@include file="all_component/header.jsp"%>
	</div>

    <div class="container">
        <h2>ĐỔI THÔNG TIN CÁ NHÂN</h2>
        
        <form action="${pageContext.request.contextPath}/updateUserInfo" method="post">

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="${userobj.email}" required>
            </div>
            
            <div class="form-group">
                <label for="phone">Số điện thoại</label>
                <input type="text" id="phone" name="phone" value="${userobj.phone}" required>
            </div>
            
            <div class="action-buttons">
                <button type="submit" class="save-btn">Lưu thay đổi</button>
                <button type="button" class="cancel-btn" onclick="window.location.href='infor_user.jsp'">Hủy bỏ</button>
            </div>
        </form>
    </div>
</body>
</html>
