package com.DAO;


import com.entity.PaymentMethod;
import java.sql.SQLException;
import java.util.List;

public interface PaymentMethodDAO {
    boolean addPaymentMethod(PaymentMethod paymentMethod);
    List<PaymentMethod> getAllPaymentMethod();
    boolean deletePaymentMethod(String accountNumber);
    PaymentMethod getPaymentMethod(String accountNumber);

}
