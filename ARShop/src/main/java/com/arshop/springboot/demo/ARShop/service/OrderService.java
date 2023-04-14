package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.OrderRepository;
import com.arshop.springboot.demo.ARShop.dao.ProductRepository;
import com.arshop.springboot.demo.ARShop.dao.VariationRepository;
import com.arshop.springboot.demo.ARShop.entity.OrderDetail;
import com.arshop.springboot.demo.ARShop.structure.RespondMessage;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {

    private final OrderRepository orderRepository;
    private final IdentifyService identifyService;
    private final VariationRepository variationRepository;
    private final ProductDetailService productDetailService;

    public OrderService(OrderRepository orderRepository, IdentifyService identifyService, VariationRepository variationRepository, ProductDetailService productDetailService) {
        this.orderRepository = orderRepository;
        this.identifyService = identifyService;
        this.variationRepository = variationRepository;
        this.productDetailService = productDetailService;
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


    public RespondMessage processOrder(List<OrderDetail> orderDetails , HttpServletRequest request){

        int selfID = identifyService.extractJwt(request);

        for(OrderDetail detail : orderDetails){
            if(detail.getCustomerID() != selfID){
                var message = RespondMessage.builder()
                        .respondMessage("Process Failed !")
                        .build();
                break;
            }
        }
        orderDetails.sort(orderDetails);
    }

}
