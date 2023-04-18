package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.CartRepository;
import com.arshop.springboot.demo.ARShop.dao.OrderDetailRepository;
import com.arshop.springboot.demo.ARShop.dao.VariationRepository;
import com.arshop.springboot.demo.ARShop.entity.Cart;
import com.arshop.springboot.demo.ARShop.entity.OrderDetail;
import com.arshop.springboot.demo.ARShop.structure.CartContext;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service
public class CartService {

    private final CartRepository cartRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final IdentifyService identifyService;
    private final VariationRepository variationRepository;

    public CartService(CartRepository cartRepository, OrderDetailRepository orderDetailRepository, IdentifyService identifyService, VariationRepository variationRepository) {
        this.cartRepository = cartRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.identifyService = identifyService;
        this.variationRepository = variationRepository;
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

    public List<CartContext> getItems(HttpServletRequest request){
        var items = orderDetailRepository.findByCartID(getCartID(identifyService.extractJwt(request)));

        List<CartContext> cartContextList = new LinkedList<>();

        if(items.size() != 0){

            for(OrderDetail element : items){
                var variation = variationRepository.findByVariationID(element.getVariationID());

                var cartContext = CartContext.builder()
                        .orderDetail(element)
                        .price(variation.getVariationPrice())
                        .build();
                cartContextList.add(cartContext);
            }
        }

        return cartContextList;
    }

}
