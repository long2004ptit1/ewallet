package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.User;
import com.sun.org.apache.bcel.internal.generic.RETURN;

public class UserDAOImpl implements UserDAO {
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
//overide/implement method
	
	
//Register
	public boolean userRegister(User us) {
		boolean f=false;
		try {
			String sql="insert into user(name,username,email,phone,password) values(?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getUserName());
			ps.setString(3, us.getEmail());
			ps.setString(4, us.getPhone());
			ps.setString(5, us.getPassword());
			
			int i=ps.executeUpdate(); // ghi lai
			if (i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	//getId 
		public int getUserIdByUsername(String username) {
		    int userId = -1;
		    try {
		        String sql = "SELECT id FROM user WHERE username = ?";
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, username);
		        ResultSet rs = ps.executeQuery();
		        if (rs.next()) {
		            userId = rs.getInt("id");
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return userId;
		}

 
// chèn số dư ban đầu vào mySQL
	public boolean insertInitialBalance(int userId, double initialBalance) {
	    boolean inserted = false;
	    try {
	        String sql = "INSERT INTO account_balance (user_id, balance) VALUES (?, ?)";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, userId);
	        ps.setDouble(2, initialBalance);
	        int rowsAffected = ps.executeUpdate();
	        if (rowsAffected == 1) {
	            inserted = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return inserted;
	}

	
//login+balance
	public User login(String email, String password) {
	    User user = null;
	    try {
	        String sql = "SELECT u.*, ab.balance,ab.created_at FROM user u LEFT JOIN account_balance ab ON u.id = ab.user_id WHERE u.email = ? AND u.password = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, email);
	        ps.setString(2, password);
	        ResultSet rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            user = new User();
	            user.setId(rs.getInt("id"));
	            user.setName(rs.getString("name"));
	            user.setUserName(rs.getString("username"));
	            user.setEmail(rs.getString("email"));
	            user.setPhone(rs.getString("phone"));
	            user.setPassword(rs.getString("password"));
	            user.setBalance(rs.getDouble("balance")); 
	            user.setCreatedAt(rs.getTimestamp("created_at")); 
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return user;
	}

	
//userList
	
	public List<User> getAllUsers() {
		List<User> userList = new ArrayList<>();
		try {
			String sql = "SELECT u.*, ab.balance, ab.created_at FROM user u LEFT JOIN account_balance ab ON u.id = ab.user_id";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setUserName(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setPassword(rs.getString("password"));
				user.setBalance(rs.getDouble("balance"));
				user.setCreatedAt(rs.getTimestamp("created_at"));
				userList.add(user);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;

	}
	
	

    // Get User by Username, Email, or Phone
	public User getUserByUsernameOrEmailOrPhone(String input) {
        User user = null;
        String sql = "SELECT * FROM user WHERE username = ? OR email = ? OR phone = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, input);
            ps.setString(2, input);
            ps.setString(3, input);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setUserName(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setPhone(rs.getString("phone"));
                    user.setPassword(rs.getString("password"));
                }
            }
        } catch (Exception e) {
        	e.printStackTrace();
        }
        return user;
    }

	  // Get Account Balance by User ID
    public double getBalanceByUserId(int userId) {
        double balance = 0;
        String sql = "SELECT balance FROM account_balance WHERE user_id = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    balance = rs.getDouble("balance");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return balance;
    }

    // Update User Balance
    public boolean updateUserBalance(int userId, double newBalance) {
        boolean updated = false;
        String sql = "UPDATE account_balance SET balance = ? WHERE user_id = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDouble(1, newBalance);
            ps.setInt(2, userId);
            updated = (ps.executeUpdate() == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updated;
    }


    public boolean changePassword(int userId, String newPassword) {
        boolean updated = false;
        String sql = "UPDATE user SET password = ? WHERE id = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, newPassword);
            ps.setInt(2, userId);
            
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                updated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return updated;
    }





}



