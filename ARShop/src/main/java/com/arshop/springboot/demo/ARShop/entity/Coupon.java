package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;

@Entity
@Table(name="coupon")
public class Coupon {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Coupon_ID")
    private int couponID;

    @Column(name="Vendor_ID")
    private int vendorID;

    @Column(name="Discount_Value")
    private int discountValue;

    @Column(name="Max_Discount")
    private int maxDiscount;

    public Coupon() {
    }

    public Coupon(int vendorID, int discountValue, int maxDiscount) {
        this.vendorID = vendorID;
        this.discountValue = discountValue;
        this.maxDiscount = maxDiscount;
    }

    public int getCouponID() {
        return couponID;
    }

    public void setCouponID(int couponID) {
        this.couponID = couponID;
    }

    public int getVendorID() {
        return vendorID;
    }

    public void setVendorID(int vendorID) {
        this.vendorID = vendorID;
    }

    public int getDiscountValue() {
        return discountValue;
    }

    public void setDiscountValue(int discountValue) {
        this.discountValue = discountValue;
    }

    public int getMaxDiscount() {
        return maxDiscount;
    }

    public void setMaxDiscount(int maxDiscount) {
        this.maxDiscount = maxDiscount;
    }

    @Override
    public String toString() {
        return "Coupon{" +
                "couponID=" + couponID +
                ", vendorID=" + vendorID +
                ", discountValue=" + discountValue +
                ", maxDiscount=" + maxDiscount +
                '}';
    }
}
