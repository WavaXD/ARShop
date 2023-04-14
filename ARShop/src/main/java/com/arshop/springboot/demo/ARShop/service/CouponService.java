package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.CouponDetailRepository;
import com.arshop.springboot.demo.ARShop.dao.CouponRepository;
import com.arshop.springboot.demo.ARShop.entity.Coupon;
import com.arshop.springboot.demo.ARShop.entity.OrderDetail;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CouponService {
    private final CouponRepository couponRepository;
    private final CouponDetailRepository couponDetailRepository;
    private final OrderService orderService;
    private final IdentifyService identifyService;

    public CouponService(CouponRepository couponRepository, CouponDetailRepository couponDetailRepository, OrderService orderService, IdentifyService identifyService) {
        this.couponRepository = couponRepository;
        this.couponDetailRepository = couponDetailRepository;
        this.orderService = orderService;
        this.identifyService = identifyService;
    }

    public List<Coupon> getAvailableCoupon(List<OrderDetail> orderDetails, HttpServletRequest request){
        System.out.println("im in coupon service");
        int selfID = identifyService.extractJwt(request);
        float tempPrice = orderService.getTotalPrice(orderDetails,selfID);
        int tempVendor = 0;

        //looping check if vendor is the same (to be upgrade to multiple in future)
        for(OrderDetail detail : orderDetails){

            if(tempVendor == 0){
                tempVendor = detail.getVendorID();
            }
            if(tempVendor != detail.getVendorID()){
                throw new IllegalArgumentException("Product is not from the same vendor!");
            }
        }

        var coupon = couponRepository.findAvailableCoupon(selfID,tempVendor);

        return coupon;
    }
}
