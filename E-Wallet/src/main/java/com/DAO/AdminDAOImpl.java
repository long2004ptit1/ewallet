package com.DAO;

import com.DB.DBConnect;
import com.entity.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDAOImpl implements AdminDAO {

    private Connection conn;

    // Constructor để khởi tạo Connection từ DBConnect
    public AdminDAOImpl() {
        try {
            this.conn = DBConnect.getConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean registerAdmin(Admin admin) {
        String query = "INSERT INTO Admins (name, username, email, phone, password, role) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, admin.getName());
            pstmt.setString(2, admin.getUserName());
            pstmt.setString(3, admin.getEmail());
            pstmt.setString(4, admin.getPhone());
            pstmt.setString(5, admin.getPassword());
            pstmt.setString(6, admin.getRole());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean checkUsernameExists(String username) {
        String query = "SELECT 1 FROM Admins WHERE username = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean checkEmailExists(String email) {
        String query = "SELECT 1 FROM Admins WHERE email = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, email);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean checkPhoneExists(String phone) {
        String query = "SELECT 1 FROM Admins WHERE phone = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, phone);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean checkSuperAdminExists() {
        String query = "SELECT 1 FROM Admins WHERE role = 'super_admin'";
        try (PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

 // Triển khai phương thức getAllAdmins
    @Override
    public List<Admin> getAllAdmins() {
        List<Admin> adminList = new ArrayList<>();
        String query = "SELECT * FROM Admins";  // Truy vấn lấy tất cả admin từ cơ sở dữ liệu

        try (PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            // Duyệt qua các kết quả và thêm vào danh sách
            while (rs.next()) {
                Admin admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setName(rs.getString("name"));
                admin.setUserName(rs.getString("username"));
                admin.setEmail(rs.getString("email"));
                admin.setPhone(rs.getString("phone"));
                admin.setPassword(rs.getString("password"));
                admin.setRole(rs.getString("role"));
                admin.setCreatedAt(rs.getTimestamp("created_at"));

                adminList.add(admin);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adminList;
    }

    @Override
    public boolean updateAdmin(Admin admin) {
        StringBuilder query = new StringBuilder("UPDATE Admins SET name = ?, username = ?, email = ?, phone = ?, role = ?");
        
        // Nếu có mật khẩu mới, thêm vào truy vấn
        if (admin.getPassword() != null && !admin.getPassword().isEmpty()) {
            query.append(", password = ?");
        }

        query.append(" WHERE id = ?");  // Xác định admin cần cập nhật theo ID

        try (PreparedStatement pstmt = conn.prepareStatement(query.toString())) {
            // Thiết lập các tham số
            pstmt.setString(1, admin.getName());
            pstmt.setString(2, admin.getUserName());
            pstmt.setString(3, admin.getEmail());
            pstmt.setString(4, admin.getPhone());
            pstmt.setString(5, admin.getRole()); // Cập nhật role

            // Nếu có mật khẩu mới, thiết lập tham số mật khẩu
            int index = 6;
            if (admin.getPassword() != null && !admin.getPassword().isEmpty()) {
                pstmt.setString(index++, admin.getPassword());
            }

            pstmt.setInt(index, admin.getId());  // Thiết lập ID admin cần cập nhật

            // Thực hiện cập nhật và kiểm tra kết quả
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }




    // Lấy admin theo ID
    public Admin getAdminById(int id) {
        Admin admin = null;
        String query = "SELECT * FROM Admins WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setName(rs.getString("name"));
                admin.setUserName(rs.getString("username"));
                admin.setEmail(rs.getString("email"));
                admin.setPhone(rs.getString("phone"));
                admin.setRole(rs.getString("role"));
                admin.setCreatedAt(rs.getTimestamp("created_at"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }
    @Override
    public boolean deleteAdmin(int id) {
        String query = "DELETE FROM Admins WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, id);  // Set giá trị ID cần xóa
            int rowsAffected = pstmt.executeUpdate();  // Thực thi câu lệnh DELETE
            return rowsAffected > 0;  // Nếu xóa thành công, sẽ có ít nhất 1 dòng bị ảnh hưởng
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


}
