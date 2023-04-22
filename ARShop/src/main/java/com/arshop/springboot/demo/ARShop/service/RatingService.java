package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.OrderDetailRepository;
import com.arshop.springboot.demo.ARShop.dao.ProductRatingRepository;
import com.arshop.springboot.demo.ARShop.entity.Order;
import com.arshop.springboot.demo.ARShop.entity.ProductRating;
import com.arshop.springboot.demo.ARShop.structure.RespondMessage;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service
public class RatingService {

    private final ProductRatingRepository productRatingRepository;
    private final OrderService orderService;
    private final IdentifyService identifyService;
    private final OrderDetailRepository orderDetailRepository;

    public RatingService(ProductRatingRepository productRatingRepository, OrderService orderService, IdentifyService identifyService, OrderDetailRepository orderDetailRepository) {
        this.productRatingRepository = productRatingRepository;
        this.orderService = orderService;
        this.identifyService = identifyService;
        this.orderDetailRepository = orderDetailRepository;
    }

    public List<Order> getWaitingRating(HttpServletRequest request){

        int selfID = identifyService.extractJwt(request);

        var order = orderService.getMyOrders(request);

        List<Order> waitingList = new LinkedList<>();

        if(order.size() != 0)
        {
            for(Order element : order){

                var orderDetail = orderDetailRepository.findByOrderID(element.getOrderID());

                var tempDetail = orderDetail.get(0);

                var getRating = productRatingRepository.findByDetailID(tempDetail.getDetailID());

                if(getRating == null){
                    waitingList.add(element);
                }
            }
        }

        return waitingList;

    }

    public List<ProductRating> getMyRating(HttpServletRequest request){
        int selfID = identifyService.extractJwt(request);

        return productRatingRepository.findByCustomerID(selfID);
    }

    public RespondMessage createRespondMessage(String message){
        var respondMessage = RespondMessage.builder()
                .respondMessage(message)
                .build();

        return respondMessage;
    }

    public RespondMessage giveRating(List<ProductRating> productRating, HttpServletRequest request){
        int selfID = identifyService.extractJwt(request);

        //check if any rating is null or zero
        for(ProductRating element : productRating){
            if(element.getRatingValue() == 0){
                return createRespondMessage("Please give any rating");
            }
        }

        for(ProductRating element : productRating){
            var rating = ProductRating.builder()
                    .customerID(selfID)
                    .productID(element.getProductID())
                    .detailID(element.getDetailID())
                    .ratingValue(element.getRatingValue())
                    .ratingComment(element.getRatingComment())
                    .build();

            productRatingRepository.save(rating);
        }

        return createRespondMessage("Give Rating Successfully");
    }

}
