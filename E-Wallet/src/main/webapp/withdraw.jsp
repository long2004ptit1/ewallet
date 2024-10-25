<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nạp tiền</title>
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
            text-transform: capitalize;
            transition: .2s linear;
        }

        /* Add space for header */
        .header-space {
            height: 80px;
            background-color: #f1f1f1;
            text-align: center;
            line-height: 50px;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .container {
            width: 80%;
            margin: 0 auto;
        }

        .deposit-form {
            padding: 20px;
            border: 1px solid #ddd;
            background-color: #fff;
            display: flex;
            justify-content: space-between;
        }

        .form-left,
        .form-right {
            width: 48%;
        }

        .form-left label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            font-size: 18px;
        }

        .form-left input,
        .form-left select,
        .form-left textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .form-left button {
            width: 100%;
            padding: 15px;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            color: white;
        }

        .form-left button:hover {
            background-color: #45a049;
        }
        
        p{
        font-size: 16px;}

        .form-right table {
            width: 100%;
            border-collapse: collapse;
        }

        .form-right table,
        .form-right th,
        .form-right td {
            border: 1px solid #ddd;
        }

        .form-right th,
        .form-right td {
            padding: 10px;
            text-align: left;
            font-size: 16px;
        }

        .form-right th {
            background-color: #f2f2f2;
        }

        .history-table {
            margin-top: 20px;
        }

        .history-table table {
            width: 100%;
            border-collapse: collapse;
        }

        .history-table table,
        .history-table th,
        .history-table td {
            border: 1px solid #ddd;
        }

        .history-table th,
        .history-table td {
            padding: 10px;
            text-align: left;
            font-size: 16px;
        }

        .history-table th {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>

    <!-- Header placeholder -->
    <div class="header-space">
 <%@include file="all_component/header.jsp"%>
    </div>

    <div class="container">
        <h1>Tạo yêu cầu rút tiền</h1>
        <div class="deposit-form">
            <div class="form-left">
                <p>Số dư quỹ: <span style="color: green;">0 VND</span></p>
                <form action="withdraw" method="post">
                <label for="amount">Số tiền rút:</label>
                <input type="number" id="amount" placeholder="Số tiền nạp">
                <p style="color: red;">Tối thiểu 10,000 VND, Tối đa 300,000,000 VND</p>

                <label for="payment-method">Cổng thanh toán:</label>
                <select id="payment-method">
                    <option value="momo">Momo (12)</option>
                    <option value="techcombank">Techcombank</option>
                    <option value="ACB">ACB</option>
                    <option value="ACB">Vietcombank</option>
                </select>
                <label for="amount">Số tài khoản</label>
                <input type="number" id="amount" placeholder="Số tài khoản">
                <label for="amount">Tên tài khoản</label>
                <input type="number" id="amount" placeholder="Tên tài khoản">

                <button type="submit">Rút tiền ngay</button>
                </form>
            </div>

            <div class="form-right">
                <table>
                    <tr>
                        <th>Hạn mức và phí:</th>
                        <th>VND</th>
                    </tr>
                    <tr>
                        <td>Tổng hạn mức ngày</td>
                        <td>Không hạn chế</td>
                    </tr>
                    <tr>
                        <td>Số tiền tối thiểu</td>
                        <td>50,000 VND</td>
                    </tr>
                    <tr>
                        <td>Số tiền tối đa</td>
                        <td>300,000,000 VND</td>
                    </tr>
                </table>
                <table style="margin-top: 10px;">
                    <tr>
                        <th>Cổng thanh toán</th>
                        <th>Phí cố định</th>

                    </tr>
                    <tr>
                        <td>Techcombank</td>
                        <td>0</td>

                    </tr>
                    <tr>
                        <td>ACB - NH TMCP A CHAU</td>
                        <td>0</td>

                    </tr>
                    <tr>
                        <td>Vietcombank</td>
                        <td>0</td>

                    </tr>
                    <tr>
                        <td>Momo (12)</td>
                        <td>0</td>
 
                    </tr>
                </table>
            </div>
        </div>

        <div class="history-table">
            <h2>Lịch sử rút tiền</h2>
            <table>
                <tr>
                    <th>Mã đơn</th>
                    <th>Số tiền</th>
                    <th>Ngân hàng</th>
                    <th>Tên tài khoản</th>
                    <th>Số tài khoản</th>
                    <th>Ngày tạo</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
                <tr>
                    <td>D671A7BD8CFEE9</td>
                    <td>10.000VND</td>
                    <td>Techcombank</td>
                    <td>Vũ Thành Long</td>
                    <td>22022004</td>
                    <td>24-10-2024 23:54</td>
                    <td style="color: blue;">Thành công</td>
                    <td><button>Xem</button></td>
                </tr>
            </table>
        </div>
    </div>

</body>

</html>
    