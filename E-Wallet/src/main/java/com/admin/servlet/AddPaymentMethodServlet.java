package com.admin.servlet;

import com.DAO.PaymentMethodDAO;
import com.DAO.PaymentMethodDAOimpl;
import com.DB.DBConnect;
import com.entity.PaymentMethod;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/add_payment_method")
public class AddPaymentMethodServlet extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");

			// Lấy các tham số từ form
			String account_number = request.getParameter("account_number");
			String name = request.getParameter("name");
			String account_name = request.getParameter("account_name");

			PaymentMethod paymentMethod = new PaymentMethod();
            paymentMethod.setAccountNumber(account_number);
            paymentMethod.setName(name);
            paymentMethod.setAccountName(account_name);
			PaymentMethodDAO paymentMethodDAO = new PaymentMethodDAOimpl(DBConnect.getConn());
			
			
			boolean isAdded = paymentMethodDAO.addPaymentMethod(paymentMethod);

            // Kiểm tra kết quả và chuyển hướng
            HttpSession session = request.getSession();
            if (isAdded) {
                session.setAttribute("successMessage", "Cổng thanh toán đã được thêm thành công!");
                response.sendRedirect("admin/payment_method.jsp"); // Trang hiển thị danh sách cổng thanh toán
            } else {
                session.setAttribute("errorMessage", "Đã xảy ra lỗi khi thêm cổng thanh toán!");
                response.sendRedirect("admin/add_payment_method.jsp"); // Trang thêm cổng thanh toán
            }
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
