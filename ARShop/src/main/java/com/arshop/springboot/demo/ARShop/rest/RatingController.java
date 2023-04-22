package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.entity.Order;
import com.arshop.springboot.demo.ARShop.entity.ProductRating;
import com.arshop.springboot.demo.ARShop.service.RatingService;
import com.arshop.springboot.demo.ARShop.structure.RespondMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/rating")
public class RatingController {

    private final RatingService ratingService;

    public RatingController(RatingService ratingService) {
        this.ratingService = ratingService;
    }

    @GetMapping("/waiting")
    public List<Order> getWaitingRating(HttpServletRequest request){
        return ratingService.getWaitingRating(request);
    }

    @GetMapping("")
    public List<ProductRating> getMyRating(HttpServletRequest request){
        return ratingService.getMyRating(request);
    }

    @Transactional
    @PostMapping("")
    public RespondMessage giveRating(@RequestBody List<ProductRating> productRating, HttpServletRequest request){
        return ratingService.giveRating(productRating, request);
    }

}
