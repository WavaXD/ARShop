package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.AddressRepository;
import com.arshop.springboot.demo.ARShop.dao.OrderDetailRepository;
import com.arshop.springboot.demo.ARShop.structure.*;
import com.arshop.springboot.demo.ARShop.dao.OrderRepository;
import com.arshop.springboot.demo.ARShop.dao.VariationRepository;
import com.arshop.springboot.demo.ARShop.entity.Address;
import com.arshop.springboot.demo.ARShop.entity.Coupon;
import com.arshop.springboot.demo.ARShop.entity.Order;
import com.arshop.springboot.demo.ARShop.entity.OrderDetail;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class OrderService {

    private final OrderRepository orderRepository;
    private final IdentifyService identifyService;
    private final VariationRepository variationRepository;
    private final ProductDetailService productDetailService;
    private final DateUtils dateUtils;
    private final OrderDetailRepository orderDetailRepository;
    private final AddressRepository addressRepository;

    public OrderService(OrderRepository orderRepository, IdentifyService identifyService, VariationRepository variationRepository, ProductDetailService productDetailService, DateUtils dateUtils, OrderDetailRepository orderDetailRepository, AddressRepository addressRepository) {
        this.orderRepository = orderRepository;
        this.identifyService = identifyService;
        this.variationRepository = variationRepository;
        this.productDetailService = productDetailService;
        this.dateUtils = dateUtils;
        this.orderDetailRepository = orderDetailRepository;
        this.addressRepository = addressRepository;
    }

    public boolean isSelfOrder(List<OrderDetail> orderDetails, int customerID){
        boolean result = true;
        for(OrderDetail detail : orderDetails){
            if(detail.getCustomerID() != customerID){
                result = false;
                break;
            }
        }
        return result;
    }

    public float getTotalPrice(List<OrderDetail> orderDetails, int customerID){

        float tempPrice = 0;

        if(!isSelfOrder(orderDetails,customerID)){
            throw new IllegalArgumentException("Not your order Don't be fool ya fool !");
        }

        for(OrderDetail detail : orderDetails){
            var variation = variationRepository.findByVariationID(detail.getVariationID());
            if(variation == null){
                productDetailService.deleteItem(detail.getDetailID());
                throw new NullPointerException("This Variation does not exists");
            }else{
                tempPrice += variation.getVariationPrice() * detail.getVariationQuanity();
            }
        }

        return tempPrice;
    }


    public RespondMessage processOrder(ProcessOrderContext processOrderContext, HttpServletRequest request){

        List<OrderDetail> orderDetails = processOrderContext.getOrderDetails();
        Coupon coupon = processOrderContext.getCoupon();
        Address address = processOrderContext.getAddress();
        Delivery delivery = processOrderContext.getDelivery();

        int selfID = identifyService.extractJwt(request);
        int tempVendor = 0;

        for(OrderDetail detail : orderDetails){
            if(detail.getCustomerID() != selfID){
                var message = RespondMessage.builder()
                        .respondMessage("Process Failed !")
                        .build();
                break;
            }
            if(detail.getVendorID() == 0){
                tempVendor = detail.getVendorID();
            }
            if(tempVendor != detail.getVendorID()){
                var message = RespondMessage.builder()
                        .respondMessage("This order is not as the same Vendor!!")
                        .build();
                break;
            }
        }

        float totalPrice = getTotalPrice(orderDetails,selfID); //total price of order
        float discountValue = coupon.getDiscountValue() / totalPrice; // discount total price by percentage

        if(discountValue > coupon.getMaxDiscount()){
            discountValue = coupon.getMaxDiscount(); // check if discountValue exceed the maxDiscount
        }
        totalPrice -= discountValue; // discount the total price

        if(totalPrice < 0){
            var message = RespondMessage.builder()
                    .respondMessage("Order can not be cheaper than 0")
                    .build();
        }else{
            totalPrice += delivery.getDeliveryCost(); //lastly add the delivery cost

            var productOrder = Order.builder()
                    .customerID(selfID)
                    .addressID(address.getAddressID())
                    .orderDate(dateUtils.asDate(dateUtils.beanLocalDate()))
                    .vendorID(tempVendor)
                    .orderPrice(totalPrice)
                    .deliveryCo(delivery.getDeliveryCo())
                    .deliveryCost(delivery.getDeliveryCost())
                    .build();

            var tempOrder = orderRepository.saveAndFlush(productOrder);

            for(OrderDetail element : orderDetails){
                var orderDetail = OrderDetail.builder()
                        .detailID(element.getDetailID())
                        .customerID(element.getCustomerID())
                        .productID(element.getProductID())
                        .variationID(element.getVariationID())
                        .orderID(productOrder.getOrderID())
                        .vendorID(element.getVendorID())
                        .cartID(element.getCartID())
                        .variationQuanity(element.getVariationQuanity())
                        .build();
                orderDetailRepository.save(orderDetail);
            }

        }

        var message = RespondMessage.builder()
                .respondMessage("Process order successfully!")
                .build();

        return message;
    }

    public List<Order> getMyOrders(HttpServletRequest request){
        int selfID = identifyService.extractJwt(request);

        var orders = orderRepository.findByCustomerID(selfID);

        return orders;
    }

    public OrderContext getMyOrderDetail(int orderID,HttpServletRequest request){
        int selfID = identifyService.extractJwt(request);

        var order = orderRepository.findByOrderID(orderID);

        if(order.getCustomerID() != selfID){
            throw new IllegalArgumentException("Not your order !");
        }

        var address = addressRepository.findByAddressID(order.getAddressID());

        var orderContext = OrderContext.builder()
                .productOrder(order)
                .address(address)
                .build();

        return orderContext;
    }


}
