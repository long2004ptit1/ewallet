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
@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	//source->override->doPost
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			
			HttpSession session=req.getSession();
			session.removeAttribute("userobj");//xóa thông tin người dùng cũ
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			if("admin@gmail.com".equals(email)&& "admin".equals(password)) {
				User us=new User();
				session.setAttribute("admin",us);
				resp.sendRedirect("admin/home.jsp");
			}else {
				
				User us=dao.login(email, password);
				if (us!=null) {
					session.setAttribute("userobj",us);
					session.setAttribute("user_id", us.getId());
					
					double userBalance = dao.getBalanceByUserId(us.getId());
                    session.setAttribute("user_balance", userBalance);
                    
					resp.sendRedirect("home.jsp");
				}
				else {
					session.setAttribute("failMsg","Tên đăng nhập hoặc mật khẩu không chính xác");
					resp.sendRedirect("index.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
