package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name="productorder")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Order_ID")
    private int orderID;

    @Column(name="Customer_ID")
    private int customerID;

    @Column(name="Address_ID")
    private int addressID;

    @Column(name="Order_Date")
    private Date orderDate;

    @Column(name="Order_Status")
    private String orderStatus;

    @Column(name="Tracking_Number")
    private String trackingNumber;

    @Column(name="Vendor_ID")
    private int vendorID;

    public Order(){}

    public Order(int customerID, int addressID, Date orderDate, String orderStatus, String trackingNumber, int vendorID) {
        this.customerID = customerID;
        this.addressID = addressID;
        this.orderDate = orderDate;
        this.orderStatus = orderStatus;
        this.trackingNumber = trackingNumber;
        this.vendorID = vendorID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getAddressID() {
        return addressID;
    }

    public void setAddressID(int addressID) {
        this.addressID = addressID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getTrackingNumber() {
        return trackingNumber;
    }

    public void setTrackingNumber(String trackingNumber) {
        this.trackingNumber = trackingNumber;
    }

    public int getVendorID() {
        return vendorID;
    }

    public void setVendorID(int vendorID) {
        this.vendorID = vendorID;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderID=" + orderID +
                ", customerID=" + customerID +
                ", addressID=" + addressID +
                ", orderDate=" + orderDate +
                ", orderStatus='" + orderStatus + '\'' +
                ", trackingNumber='" + trackingNumber + '\'' +
                ", vendorID=" + vendorID +
                '}';
    }
}
