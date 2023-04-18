package com.arshop.springboot.demo.ARShop.dao;

import com.arshop.springboot.demo.ARShop.entity.CouponDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CouponDetailRepository extends JpaRepository<CouponDetail,Integer> {


    List<CouponDetail> findByCustomerID(int customerID);

    void deleteByCouponID(int couponID);
}
