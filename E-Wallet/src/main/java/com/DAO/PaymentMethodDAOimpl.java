package com.DAO;

import com.DB.DBConnect;
import com.entity.PaymentMethod;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentMethodDAOimpl implements PaymentMethodDAO {

    private Connection conn;

    // Constructor không tham số - khởi tạo kết nối mặc định
    public PaymentMethodDAOimpl() throws SQLException {
        this.conn = DBConnect.getConn();
    }

    // Constructor có tham số - dùng trong trường hợp truyền kết nối từ bên ngoài
    public PaymentMethodDAOimpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void addPaymentMethod(PaymentMethod paymentMethod) throws SQLException {
        String sql = "INSERT INTO payment_methods (account_number, name, account_name) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, paymentMethod.getAccountnumber());
            stmt.setString(2, paymentMethod.getName());
            stmt.setString(3, paymentMethod.getAccountname());
            stmt.executeUpdate();
        }
    }

    @Override
    public List<PaymentMethod> getAllPaymentMethod() {
        List<PaymentMethod> list = new ArrayList<>();
        String sql = "SELECT * FROM payment_methods";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                String account_number = rs.getString("account_number");
                String name = rs.getString("name");
                String account_name = rs.getString("account_name");

                PaymentMethod pm = new PaymentMethod(account_number, name, account_name);
                list.add(pm);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean deletePaymentMethod(String account_number) {
        boolean isDeleted = false;
        String sql = "DELETE FROM payment_methods WHERE account_number = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, account_number);
            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                isDeleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isDeleted;
    }
}
