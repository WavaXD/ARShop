package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.entity.*;
import com.arshop.springboot.demo.ARShop.service.CartService;
import com.arshop.springboot.demo.ARShop.service.ProductDetailService;
import com.arshop.springboot.demo.ARShop.structure.CartContext;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/cart")
public class CartController {
    private final CartService cartService;
    private final ProductDetailService productDetailService;

    public CartController(CartService cartService, ProductDetailService productDetailService) {
        this.cartService = cartService;
        this.productDetailService = productDetailService;
    }

    @PostMapping("/add")
    public void addToCart(HttpServletRequest request , @RequestBody OrderDetail productDetail){
        productDetailService.addToCart(request,productDetail);
    }

    @GetMapping("/request")
    public List<CartContext> getItems(HttpServletRequest request){
        return cartService.getItems(request);
    }
}
