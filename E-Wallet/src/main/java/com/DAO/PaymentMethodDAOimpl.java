package com.DAO;

import com.entity.PaymentMethod;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentMethodDAOimpl implements PaymentMethodDAO {

	private Connection conn;

	// Constructor có tham số - dùng trong trường hợp truyền kết nối từ bên ngoài
	public PaymentMethodDAOimpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addPaymentMethod(PaymentMethod paymentMethod) {
		boolean f = false;

		try {
			String sql = "INSERT INTO payment_methods (account_number, name, account_name) VALUES (?, ?, ?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, paymentMethod.getAccountNumber());
			stmt.setString(2, paymentMethod.getName());
			stmt.setString(3, paymentMethod.getAccountName());
			stmt.executeUpdate();
			int i = stmt.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<PaymentMethod> getAllPaymentMethod() {
		List<PaymentMethod> list = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM payment_methods";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				PaymentMethod pm=new PaymentMethod();
				pm.setAccountNumber(rs.getString("account_number"));
				pm.setName(rs.getString("name"));
				pm.setAccountName(rs.getString("account_name"));

				list.add(pm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean deletePaymentMethod(String accountNumber) {
		boolean isDeleted = false;
		String sql = "DELETE FROM payment_methods WHERE account_number = ?";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, accountNumber);
			int affectedRows = ps.executeUpdate();
			if (affectedRows > 0) {
				isDeleted = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isDeleted;
	}

	@Override
	public PaymentMethod getPaymentMethod(String accountNumber) {
		PaymentMethod pm=null;
		try {
			String sql="select * from payment_methods where account_number=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, accountNumber);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				pm=new PaymentMethod();
				pm.setAccountNumber(rs.getString(1));
				pm.setName(rs.getString(2));
				pm.setAccountName(rs.getString(3));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pm;
	}
}
