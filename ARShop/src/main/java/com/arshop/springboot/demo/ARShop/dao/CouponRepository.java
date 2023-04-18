package com.arshop.springboot.demo.ARShop.dao;

import com.arshop.springboot.demo.ARShop.entity.Coupon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CouponRepository extends JpaRepository<Coupon,Integer> {
//fix subquery can't list
    @Query("Select c From Coupon c Where c.couponID = :couponID AND c.vendorID = :vendorID")
    Coupon findAvailableCoupon(int couponID, int vendorID);

    void deleteByCouponID(int couponID);

    List<Coupon> findByVendorID(int vendorID);

    Coupon findByCouponID(int couponID);
}
