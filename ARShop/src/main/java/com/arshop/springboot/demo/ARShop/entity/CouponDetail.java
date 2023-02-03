package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;

@Entity
@Table(name="coupondetail")
public class CouponDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="CouponDetail_ID")
    private int couponDetailID;

    @Column(name="Customer_ID")
    private int customerID;

    @Column(name="Coupon_ID")
    private int couponID;

    public CouponDetail() {
    }

    public CouponDetail(int customerID, int couponID) {
        this.customerID = customerID;
        this.couponID = couponID;
    }

    public int getCouponDetailID() {
        return couponDetailID;
    }

    public void setCouponDetailID(int couponDetailID) {
        this.couponDetailID = couponDetailID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getCouponID() {
        return couponID;
    }

    public void setCouponID(int couponID) {
        this.couponID = couponID;
    }

    @Override
    public String toString() {
        return "CouponDetail{" +
                "couponDetailID=" + couponDetailID +
                ", customerID=" + customerID +
                ", couponID=" + couponID +
                '}';
    }
}
