package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.CartRepository;
import com.arshop.springboot.demo.ARShop.dao.OrderDetailRepository;
import com.arshop.springboot.demo.ARShop.entity.Cart;
import com.arshop.springboot.demo.ARShop.entity.OrderDetail;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {

    private final CartRepository cartRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final IdentifyService identifyService;

    public CartService(CartRepository cartRepository, OrderDetailRepository orderDetailRepository, IdentifyService identifyService) {
        this.cartRepository = cartRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.identifyService = identifyService;
    }

    public void initializeCart(int customerID){
        var cart = Cart.builder()
                .customerID(customerID)
                .build();

        cartRepository.save(cart);
    }

    public int getCartID(int customerID){
        var cart = cartRepository.findByCustomerID(customerID);

        return cart.get(0).getCartID();
    }

    public List<OrderDetail> getItems(HttpServletRequest request){
        var items = orderDetailRepository.findByCartID(getCartID(identifyService.extractJwt(request)));

        return items;
    }

}
