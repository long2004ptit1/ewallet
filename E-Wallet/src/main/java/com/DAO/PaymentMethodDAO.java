package com.DAO;


import com.entity.PaymentMethod;
import java.sql.SQLException;
import java.util.List;

public interface PaymentMethodDAO {
    void addPaymentMethod(PaymentMethod paymentMethod) throws SQLException;
    List<PaymentMethod> getAllPaymentMethod();
    boolean deletePaymentMethod(String account_number);


}
