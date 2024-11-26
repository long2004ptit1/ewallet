package com.DAO;

import com.entity.Admin;

public interface AdminDAO {
    boolean registerAdmin(Admin admin);
    boolean checkUsernameExists(String username);
    boolean checkEmailExists(String email);
    boolean checkPhoneExists(String phone);
    boolean checkSuperAdminExists(); 
}
