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
//generate constructor using filed
	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
//overide/implement method
	
	
//Register
	public boolean userRegister(User us) {
		boolean f=false;
		try {
			String sql="insert into user(name,username,email,phone,password) values(?,?,?,?,?)"; //values: vitri can dien
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
//	source->override
	public User login(String email, String password) {
		User us=null;
		try {
			String sql="select * from user where email=? and password=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,email);
			ps.setString(2,password);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				us=new User();
				us.setId(rs.getInt(1));
				
				us.setName(rs.getString(2));
				us.setUserName(rs.getString(3));
				us.setEmail(rs.getString(4));
				us.setPhone(rs.getString(5));
				us.setPassword(rs.getString(6));

				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}
	
	
//userList
	
	public List<User> getAllUsers() {
		List<User> userList = new ArrayList<>();
		try {
			String sql = "SELECT u.*, ab.balance FROM user u LEFT JOIN account_balance ab ON u.id = ab.user_id";
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
				user.setBalance(rs.getFloat("balance"));
				userList.add(user);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
	

	
////
	
	
	public float getBalance(int userId) throws SQLException {
        String query = "SELECT balance FROM account_balance WHERE user_id = ?";
        PreparedStatement pst = conn.prepareStatement(query);
        pst.setInt(1, userId);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            return rs.getFloat("balance");
        }
        return 0;
    }

    public boolean updateBalance(int userId, float newBalance) throws SQLException {
        String query = "UPDATE account_balance SET balance = ?, last_updated = NOW() WHERE user_id = ?";
        PreparedStatement pst = conn.prepareStatement(query);
        pst.setFloat(1, newBalance);
        pst.setInt(2, userId);
        return pst.executeUpdate() > 0;
    }

    public boolean canTransfer(int senderId, float amount) throws SQLException {
        float senderBalance = getBalance(senderId);
        return senderBalance >= amount;
    }	
}
