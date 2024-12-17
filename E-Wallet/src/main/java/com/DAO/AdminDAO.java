
package com.DAO;

import java.util.List;

import com.entity.Admin;

public interface AdminDAO {
    boolean registerAdmin(Admin admin);
    boolean checkUsernameExists(String username);
    boolean checkEmailExists(String email);
    boolean checkPhoneExists(String phone);
    boolean checkSuperAdminExists();
    boolean updateAdmin(Admin admin);
    Admin getAdminById(int id);
 // Khai báo phương thức lấy tất cả admin
    List<Admin> getAllAdmins();
 // Khai báo phương thức xóa Admin
    boolean deleteAdmin(int id);
}
