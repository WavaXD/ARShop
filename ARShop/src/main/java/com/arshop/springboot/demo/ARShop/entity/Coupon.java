package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;


@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
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

    @Column(name="Expire_Date")
    private Date expireDate;

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
