package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.entity.Coupon;
import com.arshop.springboot.demo.ARShop.entity.OrderDetail;
import com.arshop.springboot.demo.ARShop.entity.Vendor;
import com.arshop.springboot.demo.ARShop.service.CouponService;
import com.arshop.springboot.demo.ARShop.structure.RespondMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/coupon")
public class CouponController {

    private final CouponService couponService;

    public CouponController(CouponService couponService) {
        this.couponService = couponService;
    }

    @Transactional
    @PostMapping("/available")
    public List<Coupon> getAvailableCoupon(@RequestBody List<OrderDetail> orderDetails, HttpServletRequest request){

        return couponService.getAvailableCoupon(orderDetails,request);
    }

    @GetMapping(path = "/vendor/{vendorID}")
    public List<Coupon> getVendorCoupon(@PathVariable int vendorID, HttpServletRequest request){
        return couponService.findVendorCoupon(vendorID);
    }

    @Transactional
    @GetMapping(path = "/{couponID}")
    public RespondMessage collectCoupon(@PathVariable int couponID, HttpServletRequest request){
        return couponService.collectCoupon(couponID,request);
    }

}
