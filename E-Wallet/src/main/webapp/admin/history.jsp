<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lịch sử giao dịch - Admin</title>

<style>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;300;400;500;600&display=swap");

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
    width: 100vw; /* Full width */
    margin: 0 auto;
    padding: 20px;
    font-size: 15px;
}

h2 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
    text-align: center;
}

.search-filters {
    display: flex;
    gap: 10px;
    margin-bottom: 20px;
    justify-content: center;
}

.search-filters input, .search-filters select, .search-filters button {
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

.search-filters select {
    padding-right: 30px;
}

.search-filters button {
    cursor: pointer;
    font-weight: bold;
}

.search-filters .btn-filter {
    background-color: #007bff;
    color: white;
}

.search-filters .btn-reset {
    background-color: #dc3545;
    color: white;
}

.table-responsive {
    overflow-x: auto;
}

.transaction-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
}

.transaction-table th, .transaction-table td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: center;
    font-size: 16px;
    white-space: nowrap;
}

.transaction-table th {
    background-color: #f8f9fa;
    font-weight: bold;
}

.date-input {
    width: 150px;
    text-transform: none;
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

    <!-- Header placeholder -->
    <div class="header-space">
        <%@include file="header.jsp"%>
    </div>

    <div class="container">
        <h2>Lịch sử giao dịch - Admin</h2>
        
        <!-- Search Filters -->
        <div class="search-filters">
            <input type="text" placeholder="Mã đơn" />
            <input type="text" placeholder="Nội dung" />
            <select>
                <option>Chọn loại</option>
                <option>Rút tiền</option>
                <option>Nạp tiền</option>
                <option>Chuyển tiền</option>
                <option>Nhận tiền</option>
            </select>
            <input type="date" class="date-input" placeholder="Từ ngày" />
            <input type="date" class="date-input" placeholder="Đến ngày" />
            <button class="btn-filter">Lọc</button>
            <button class="btn-reset">Bỏ lọc</button>
        </div>
        
        <!-- Transaction Table -->
        <div class="table-responsive">
            <table class="transaction-table">
                <thead>
                    <tr>
                        <th>Mã đơn</th>
                        <th>Tài khoản chuyển</th>
                        <th>Tên người chuyển</th>
                        <th>Cổng thanh toán</th>
                        <th>Tài khoản nhận</th>
                        <th>Tên người chuyển</th>
                        <th>Số tiền</th>
                        <th>Thời gian tạo</th>
                        <th>Thời gian xử lý</th>
                        <th>Loại giao dịch</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Sample Data Row -->
                    <tr>
                        <td>12345</td>
                        <td>nguyenvana</td>
                        <td>Nguyễn Văn A</td>
                        <td>Không</td>
                        <td>tranthib</td>
                        <td>Trần Thị B</td>
                        <td>500,000 VND</td>
                        <td>2024-10-28 09:15:44.0	</td>
                        <td>Không</td>
                        <td>Chuyển khoản</td>
                    </tr>
                    <tr>
                        <td>12346</td>
                        <td>nguyenvanc</td>
                        <td>Nguyễn Văn C</td>
                        <td>Momo</td>
                        <td>0977735502</td>
                        <td>Vũ Thành Long</td>
                        <td>10,500,000 VND</td>
                        <td>2024-10-28 09:15:44.0	</td>
                        <td>2024-10-28 09:15:44.0	</td>
                        <td>Rút tiền</td>
                    </tr>
                    <!-- More sample rows as needed -->
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
