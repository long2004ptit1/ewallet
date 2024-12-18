package com.entity;

public class PaymentMethod {
    private String accountnumber;
    private String name;
    private String accountname;

    // Constructor với ba tham số
    public PaymentMethod(String accountnumber, String name, String accountname) {
        this.accountnumber = accountnumber;
        this.name = name;
        this.accountname = accountname;
    }

    // Getters và Setters
    public String getAccountnumber() {
        return accountnumber;
    }

    public void setAccountnumber(String accountnumber) {
        this.accountnumber = accountnumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAccountname() {
        return accountname;
    }

    public void setAccountname(String accountname) {
        this.accountname = accountname;
    }
}
