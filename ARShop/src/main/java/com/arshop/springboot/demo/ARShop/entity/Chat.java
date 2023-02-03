package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name="Chat")
public class Chat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Chat_ID")
    private int chatID;

    @Column(name="Customer_ID")
    private int customerID;

    @Column(name="Vendor_ID")
    private int vendorID;

    @Column(name="Chat_Detail")
    private String chatDetail;

    @Column(name="Chat_Time")
    private Date chatTime;

    public Chat() {
    }

    public Chat(int customerID, int vendorID, String chatDetail, Date chatTime) {
        this.customerID = customerID;
        this.vendorID = vendorID;
        this.chatDetail = chatDetail;
        this.chatTime = chatTime;
    }

    public int getChatID() {
        return chatID;
    }

    public void setChatID(int chatID) {
        this.chatID = chatID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getVendorID() {
        return vendorID;
    }

    public void setVendorID(int vendorID) {
        this.vendorID = vendorID;
    }

    public String getChatDetail() {
        return chatDetail;
    }

    public void setChatDetail(String chatDetail) {
        this.chatDetail = chatDetail;
    }

    public Date getChatTime() {
        return chatTime;
    }

    public void setChatTime(Date chatTime) {
        this.chatTime = chatTime;
    }

    @Override
    public String toString() {
        return "Chat{" +
                "chatID=" + chatID +
                ", customerID=" + customerID +
                ", vendorID=" + vendorID +
                ", chatDetail='" + chatDetail + '\'' +
                ", chatTime=" + chatTime +
                '}';
    }
}
