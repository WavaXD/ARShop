package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.entity.Address;
import com.arshop.springboot.demo.ARShop.entity.Coupon;
import com.arshop.springboot.demo.ARShop.entity.Order;
import com.arshop.springboot.demo.ARShop.entity.OrderDetail;
import com.arshop.springboot.demo.ARShop.service.OrderService;
import com.arshop.springboot.demo.ARShop.structure.Delivery;
import com.arshop.springboot.demo.ARShop.structure.OrderContext;
import com.arshop.springboot.demo.ARShop.structure.ProcessOrderContext;
import com.arshop.springboot.demo.ARShop.structure.RespondMessage;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/order")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PostMapping("/total")
    public float getTotalPrice(@RequestBody List<OrderDetail> orderDetails , HttpServletRequest request){
        return orderService.getTotalPrice(orderDetails,2);
    }


    @PostMapping("/process")
    public RespondMessage processOrder(@RequestBody ProcessOrderContext processOrderContext,
                                       HttpServletRequest request){
        return orderService.processOrder(processOrderContext,request);
    }

    @PostMapping("/test")
    public void testJson(@RequestBody ProcessOrderContext processOrderContext, HttpServletRequest request){

        for(OrderDetail element : processOrderContext.getOrderDetails()){
            System.out.println(element);
        }

        System.out.println(processOrderContext.getCoupon().getExpireDate());

        System.out.println(processOrderContext.getAddress().getAddressID());
    }

    @GetMapping("/orders")
    public List<Order> getMyOrder(HttpServletRequest request){
        return orderService.getMyOrders(request);
    }

    @GetMapping(path = "/{orderID}")
    public OrderContext getMyOrderDetail(@PathVariable int orderID,HttpServletRequest request){
        return orderService.getMyOrderDetail(orderID,request);
    }

}
