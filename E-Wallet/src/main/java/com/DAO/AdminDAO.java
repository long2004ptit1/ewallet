package com.DAO;

import com.entity.Admin;

public interface AdminDAO {
    boolean registerAdmin(Admin admin);
    boolean checkUsernameExists(String username);
    boolean checkEmailExists(String email); // Kiểm tra nếu email đã tồn tại
    boolean checkPhoneExists(String phone); // Kiểm tra nếu phone đã tồn tại
    boolean checkSuperAdminExists(); // Kiểm tra nếu super_admin đã tồn tại
}
