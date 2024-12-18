package com.admin.servlet;

import com.DAO.PaymentMethodDAO;
import com.DAO.PaymentMethodDAOimpl;
import com.DB.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/DeletePaymentMethod")
public class DeletePaymentMethodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Lấy tham số từ URL
            String account_number = req.getParameter("account_number");

            // Khởi tạo DAO
            PaymentMethodDAO dao = new PaymentMethodDAOimpl(DBConnect.getConn());
            boolean isDeleted = dao.deletePaymentMethod(account_number);

            // Xử lý thông báo qua session
            HttpSession session = req.getSession();
            if (isDeleted) {
                session.setAttribute("succMsg", "Xóa phương thức thanh toán thành công!");
            } else {
                session.setAttribute("failMsg", "Xóa phương thức thanh toán thất bại!");
            }

            // Chuyển hướng về trang danh sách
            resp.sendRedirect("payment_method.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
