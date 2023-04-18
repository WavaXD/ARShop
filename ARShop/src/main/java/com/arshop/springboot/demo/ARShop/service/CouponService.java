package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.CouponDetailRepository;
import com.arshop.springboot.demo.ARShop.dao.CouponRepository;
import com.arshop.springboot.demo.ARShop.entity.Coupon;
import com.arshop.springboot.demo.ARShop.entity.CouponDetail;
import com.arshop.springboot.demo.ARShop.entity.OrderDetail;
import com.arshop.springboot.demo.ARShop.entity.Vendor;
import com.arshop.springboot.demo.ARShop.structure.RespondMessage;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.LinkedList;
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
        System.out.println("before coupondetail query");
        var coupon = couponDetailRepository.findByCustomerID(selfID); //query to get what you own (coupon)
        List<Coupon> couponDetailList = new LinkedList<>();
        System.out.println("after coupondetail query");

        for(CouponDetail element: coupon){
            //get the coupon detail query by couponID that you own
            var theCoupon = couponRepository.findAvailableCoupon(element.getCouponID(),tempVendor);
            if(isExpire(theCoupon)){
                couponRepository.deleteByCouponID(theCoupon.getCouponID());
            }else{
                couponDetailList.add(theCoupon);
            }

        }

        return couponDetailList;
    }

    public boolean isExpire(Coupon coupon){
        boolean result = false;
        LocalDate dateNow = LocalDate.now();

        LocalDate dateCoupon = coupon.getExpireDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

        if(dateNow.isBefore(dateCoupon)){
            result = false;
        }else{
            result = true;
            couponDetailRepository.deleteByCouponID(coupon.getCouponID());
        }

        return result;
    }

    public List<Coupon> findVendorCoupon(int vendorID){
        return couponRepository.findByVendorID(vendorID);
    }

    public RespondMessage collectCoupon(int couponID, HttpServletRequest request){
        int selfID = identifyService.extractJwt(request);

        var coupon = couponRepository.findByCouponID(couponID);

        if(coupon != null){

            var customerCoupon = couponDetailRepository.findByCustomerID(selfID);

            for(CouponDetail element : customerCoupon){
                if(element.getCouponID() == couponID){
                    var respondMessage = RespondMessage.builder()
                            .respondMessage("You already have this coupon")
                            .build();

                    return respondMessage;
                }
            }

            var couponDetail = CouponDetail.builder()
                    .customerID(selfID)
                    .couponID(coupon.getCouponID())
                    .build();

            couponDetailRepository.save(couponDetail);



        }else{
            throw new NullPointerException();
        }

        var respondMessage = RespondMessage.builder()
                .respondMessage("Collect coupon Successfully!")
                .build();

        return respondMessage;
    }

}
