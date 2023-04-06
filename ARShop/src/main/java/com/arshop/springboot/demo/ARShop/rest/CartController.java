package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.entity.*;
import com.arshop.springboot.demo.ARShop.service.ProductDetailService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/cart")
public class CartController {
    private final ProductDetailService productDetailService;

    public CartController(ProductDetailService productDetailService) {
        this.productDetailService = productDetailService;
    }

    @PostMapping("/add")
    public void addToCart(HttpServletRequest request , @RequestBody OrderDetail productDetail){
        productDetailService.addToCart(request,productDetail);
    }
}
