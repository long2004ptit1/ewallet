package com.user.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
//source->override->doPost
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			// Thiết lập encoding cho request và response
	        req.setCharacterEncoding("UTF-8");
	        resp.setCharacterEncoding("UTF-8");
	        
	        
			String name = req.getParameter("name");
			String userName = req.getParameter("username");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
			String checkBox = req.getParameter("checkBox");

			User us = new User();
			us.setName(name);
			us.setUserName(userName);
			us.setEmail(email);
			us.setPhone(phone);
			us.setPassword(password);

			HttpSession session = req.getSession();
			session.removeAttribute("userobj");
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f = dao.userRegister(us);
			if (checkBox != null) {
				if (f) {
                    // Lấy ID của người dùng mới đăng ký
                    int userId = dao.getUserIdByUsername(userName); // Phương thức này sẽ lấy ID của người dùng vừa tạo

                    // Chèn số dư ban đầu cho người dùng mới vào bảng account_balance
                    if (userId != -1) { // Kiểm tra nếu ID hợp lệ
                        boolean isBalanceInserted = dao.insertInitialBalance(userId, 0); // Đặt số dư ban đầu là 0
                        if (isBalanceInserted) {
                            session.setAttribute("succMsg", "Đăng ký thành công. Bạn sẽ chuyển đến Trang Chủ sau 3 giây!");
                            resp.sendRedirect("register.jsp");
                        } else {
                            session.setAttribute("failMsg", "Tên đăng nhập hoặc email hoặc số điện thoại đã tồn tại");
                            resp.sendRedirect("register.jsp");
                        }
                    }
                } else {
                    session.setAttribute("failMsg", "Tên đăng nhập hoặc email hoặc số điện thoại đã tồn tại");
                    resp.sendRedirect("register.jsp");
                }

			} else {
				session.setAttribute("failMsg", "Vui lòng chấp nhận điều khoản");
				resp.sendRedirect("register.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
