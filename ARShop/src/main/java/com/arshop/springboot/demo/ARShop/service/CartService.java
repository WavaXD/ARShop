package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.CartRepository;
import com.arshop.springboot.demo.ARShop.entity.Cart;
import org.springframework.stereotype.Service;

@Service
public class CartService {

    private final CartRepository cartRepository;

    public CartService(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    public void initializeCart(int customerID){
        var cart = Cart.builder()
                .customerID(customerID)
                .build();

        cartRepository.save(cart);
    }

}
