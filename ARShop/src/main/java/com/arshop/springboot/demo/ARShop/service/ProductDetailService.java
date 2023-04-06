package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.OrderDetailRepository;
import com.arshop.springboot.demo.ARShop.entity.OrderDetail;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

@Service
public class ProductDetailService {

    private final OrderDetailRepository orderDetailRepository;
    private final IdentifyService identifyService;
    private final CartService cartService;

    public ProductDetailService(OrderDetailRepository orderDetailRepository, IdentifyService identifyService, CartService cartService) {
        this.orderDetailRepository = orderDetailRepository;
        this.identifyService = identifyService;
        this.cartService = cartService;
    }

    public void addToCart(HttpServletRequest request, OrderDetail productDetail){

        if(!inCart(productDetail,request)){
            var cartProduct = OrderDetail.builder()
                    .customerID(identifyService.extractJwt(request))
                    .productID(productDetail.getProductID())
                    .variationID(productDetail.getVariationID())
                    .vendorID(productDetail.getVendorID())
                    .cartID(cartService.getCartID(identifyService.extractJwt(request)))
                    .variationQuanity(productDetail.getVariationQuanity())
                    .build();

            orderDetailRepository.save(cartProduct);
        }
    }

    //Check if item is in cart then update instead of add
    public boolean inCart(OrderDetail productDetail, HttpServletRequest request){
        //Query
        var item = orderDetailRepository.findByProductIDAndVariationIDAndCartID(
                productDetail.getProductID(),// get productID
                productDetail.getVariationID(),// get variationID
                cartService.getCartID(identifyService.extractJwt(request))); // get cartID of customer
        boolean inCart = false;

        if(!item.isEmpty()){

            int tempID = item.get(0).getDetailID(); // ID to update or delete item in the cart

            if(productDetail.getVariationQuanity() == 0){
                deleteItem(tempID);
                inCart = true;
            }else{
                var cartProduct = OrderDetail.builder()
                        .detailID(tempID)
                        .customerID(identifyService.extractJwt(request))
                        .productID(productDetail.getProductID())
                        .variationID(productDetail.getVariationID())
                        .vendorID(productDetail.getVendorID())
                        .cartID(cartService.getCartID(identifyService.extractJwt(request)))
                        .variationQuanity(productDetail.getVariationQuanity())
                        .build();

                orderDetailRepository.save(cartProduct);
                inCart = true;
            }
        }
        return inCart;
    }

    public void deleteItem(int detailID){
        orderDetailRepository.deleteById(detailID);
    }
}
