package com.arshop.springboot.demo.ARShop.dao;

import com.arshop.springboot.demo.ARShop.entity.Coupon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CouponRepository extends JpaRepository<Coupon,Integer> {

    @Query("Select c From Coupon c Where c.couponID = (Select b.couponID From CouponDetail b Where b.customerID = :customerID) AND c.vendorID = :vendorID")
    List<Coupon> findAvailableCoupon(int customerID, int vendorID);
}
