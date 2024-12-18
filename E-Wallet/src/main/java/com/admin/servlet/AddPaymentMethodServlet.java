package com.admin.servlet;

import com.DAO.PaymentMethodDAO;
import com.DAO.PaymentMethodDAOimpl;
import com.entity.PaymentMethod;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/add_payment_method")
public class AddPaymentMethodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Thiết lập encoding cho request và response
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Lấy các tham số từ form
        String account_number = request.getParameter("account_number");
        String name = request.getParameter("name");
        String account_name = request.getParameter("account_name");

        // Debug: In thông tin ra console để kiểm tra
        System.out.println("Account Number: " + account_number);
        System.out.println("Name: " + name);
        System.out.println("Account Name: " + account_name);

        // Tạo đối tượng PaymentMethod
        PaymentMethod paymentMethod = new PaymentMethod(account_number, name, account_name);

        // Sử dụng DAO để thêm phương thức thanh toán vào cơ sở dữ liệu
        PaymentMethodDAO paymentMethodDAO = new PaymentMethodDAOimpl();
        try {
            paymentMethodDAO.addPaymentMethod(paymentMethod);
            // Chuyển hướng về trang danh sách phương thức thanh toán sau khi thêm thành công
            response.sendRedirect("admin/payment_method.jsp");
        } catch (SQLException e) {
            // Xử lý lỗi nếu có
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi khi thêm phương thức thanh toán!");
            request.getRequestDispatcher("admin/add_payment_method.jsp").forward(request, response);
            PaymentMethodDAO PaymentMethodDAO = new PaymentMethodDAOimpl();
            List<PaymentMethod> list = paymentMethodDAO.getAllPaymentMethod();

            // Truyền danh sách vào JSP để hiển thị
            request.setAttribute("paymentMethods", list);
            request.getRequestDispatcher("/admin/payment_method.jsp").forward(request, response);
        }
    }
}
