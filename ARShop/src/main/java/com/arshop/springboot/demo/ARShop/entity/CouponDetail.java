package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;
import lombok.Builder;

@Builder
@Entity
@Table(name="coupondetail")
public class CouponDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Coupon_Detail_ID")
    private int couponDetailID;

    @Column(name="Customer_ID")
    private int customerID;

    @Column(name="Coupon_ID")
    private int couponID;

    public CouponDetail(){

    }

    public CouponDetail(int couponDetailID, int customerID, int couponID) {
        this.couponDetailID = couponDetailID;
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
