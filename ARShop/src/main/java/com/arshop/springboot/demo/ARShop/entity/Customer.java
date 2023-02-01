package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name="customer")
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Customer_ID")
    private int customerID;

    @Column(name="Customer_Email")
    private String customerEmail;

    @Column(name="Customer_Password")
    private String customerPassword;

    @Column(name="Customer_Name")
    private String customerName;

    @Column(name="Customer_Tel")
    private String customerTel;

    @Column(name="Customer_Gender")
    private String customerGender;

    @Column(name="Customer_Birthdate")
    private Date customerBirthdate;

    @Column(name="Is_Admin")
    private boolean isAdmin;

    public Customer(){}

    public Customer(int customerID, String customerEmail, String customerPassword, String customerName, String customerTel, String customerGender, Date customerBirthdate, boolean isAdmin) {
        this.customerID = customerID;
        this.customerEmail = customerEmail;
        this.customerPassword = customerPassword;
        this.customerName = customerName;
        this.customerTel = customerTel;
        this.customerGender = customerGender;
        this.customerBirthdate = customerBirthdate;
        this.isAdmin = isAdmin;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerPassword() {
        return customerPassword;
    }

    public void setCustomerPassword(String customerPassword) {
        this.customerPassword = customerPassword;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerTel() {
        return customerTel;
    }

    public void setCustomerTel(String customerTel) {
        this.customerTel = customerTel;
    }

    public String getCustomerGender() {
        return customerGender;
    }

    public void setCustomerGender(String customerGender) {
        this.customerGender = customerGender;
    }

    public Date getCustomerBirthdate() {
        return customerBirthdate;
    }

    public void setCustomerBirthdate(Date customerBirthdate) {
        this.customerBirthdate = customerBirthdate;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "customerID=" + customerID +
                ", customerEmail='" + customerEmail + '\'' +
                ", customerPassword='" + customerPassword + '\'' +
                ", customerName='" + customerName + '\'' +
                ", customerTel='" + customerTel + '\'' +
                ", customerGender='" + customerGender + '\'' +
                ", customerBirthdate=" + customerBirthdate +
                ", isAdmin=" + isAdmin +
                '}';
    }
}