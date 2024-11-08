package com.DAO;

import com.DB.DBConnect;
import com.entity.Admin;
import com.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdminDAOImpl implements AdminDAO {
	private Connection conn;

    public AdminDAOImpl(Connection conn) {
        this.conn = conn;
    }
    @Override
    public boolean registerAdmin(Admin admin) {
        String query = "INSERT INTO Admins (name, username, email, phone, password, role) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnect.getConn();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, admin.getName());
            pstmt.setString(2, admin.getUserName());
            pstmt.setString(3, admin.getEmail());
            pstmt.setString(4, admin.getPhone());
            pstmt.setString(5, admin.getPassword());
            pstmt.setString(6, admin.getRole());
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean checkUsernameExists(String username) {
        String query = "SELECT 1 FROM Admins WHERE username = ?";
        try (Connection conn = DBConnect.getConn();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean checkEmailExists(String email) {
        String query = "SELECT 1 FROM Admins WHERE email = ?";
        try (Connection conn = DBConnect.getConn();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, email);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean checkPhoneExists(String phone) {
        String query = "SELECT 1 FROM Admins WHERE phone = ?";
        try (Connection conn = DBConnect.getConn();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, phone);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean checkSuperAdminExists() {
        String query = "SELECT 1 FROM Admins WHERE role = 'super_admin'";
        try (Connection conn = DBConnect.getConn();
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
  //adminList
	
  	public List<Admin> getAllAdmins() {
  		List<Admin> adminList = new ArrayList<>();
  		try {
  			String sql = "SELECT * FROM Admins";
  			PreparedStatement ps = conn.prepareStatement(sql);
  			ResultSet rs = ps.executeQuery();

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

  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		return adminList;

  	}
  	
    
    
    
    
    
    
    
    
    
    
    
    
    
}
