package com.DAO;

import com.entity.User;

public interface UserDAO {
	public boolean userRegister(User us);
	public User login(String email, String password);
	public User getUserByUsernameOrEmailOrPhone(String input);
	boolean changePassword(int userId, String newPassword); // Add this line
	 public boolean updateUserInfo(User user);
}
