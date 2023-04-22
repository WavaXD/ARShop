package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.FavoriteRepository;
import com.arshop.springboot.demo.ARShop.dao.ProductPictureRepository;
import com.arshop.springboot.demo.ARShop.dao.ProductRepository;
import com.arshop.springboot.demo.ARShop.dao.VariationRepository;
import com.arshop.springboot.demo.ARShop.entity.Favorite;
import com.arshop.springboot.demo.ARShop.entity.Product;
import com.arshop.springboot.demo.ARShop.structure.ProductContext;
import com.arshop.springboot.demo.ARShop.structure.RespondMessage;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service
public class FavoriteService {

    private final IdentifyService identifyService;
    private final FavoriteRepository favoriteRepository;
    private final ProductRepository productRepository;
    private final ProductPictureRepository productPictureRepository;
    private final VariationRepository variationRepository;

    public FavoriteService(IdentifyService identifyService, FavoriteRepository favoriteRepository, ProductRepository productRepository, ProductPictureRepository productPictureRepository, VariationRepository variationRepository) {
        this.identifyService = identifyService;
        this.favoriteRepository = favoriteRepository;
        this.productRepository = productRepository;
        this.productPictureRepository = productPictureRepository;
        this.variationRepository = variationRepository;
    }

    public List<ProductContext> getFavorite(HttpServletRequest request){
        int selfID = identifyService.extractJwt(request);

        var favorite = favoriteRepository.findByCustomerID(selfID);

        List<ProductContext> productContextList = new LinkedList<>();

        if(favorite.size() != 0){
            for(Favorite element : favorite){

                int variationPrice = variationRepository.findCheapest(element.getProductID());
                var picture = productPictureRepository.findByProductID(element.getProductID());
                var product = productRepository.findByProductID(element.getProductID());

                var pContext = ProductContext.builder()
                        .product(product)
                        .price(variationPrice)
                        .productPicture(picture.get(0))
                        .build();
                productContextList.add(pContext);
            }
        }

        return productContextList;
    }

    public RespondMessage createRespondMessage(String message){
        var respondMessage = RespondMessage.builder()
                .respondMessage(message)
                .build();

        return respondMessage;
    }

    public RespondMessage addFavorite(Product product, HttpServletRequest request){
        int selfID = identifyService.extractJwt(request);

        System.out.println(product.getProductID());

        var getFavroite = favoriteRepository.findByCustomerIDAndProductID(selfID,product.getProductID());

        if(getFavroite != null){
            return createRespondMessage("Already has This Favorite Product");
        }else{
            var favorite = Favorite.builder()
                    .customerID(selfID)
                    .productID(product.getProductID())
                    .build();

            favoriteRepository.save(favorite);
        }

        return createRespondMessage("Add Favorite Product Successfully");
    }

    public RespondMessage deleteFavorite(int productID, HttpServletRequest request){
        int selfID = identifyService.extractJwt(request);

        var getFavorite = favoriteRepository.findByCustomerIDAndProductID(selfID,productID);

        if(getFavorite != null){
            favoriteRepository.delete(getFavorite);
        }else{
            return createRespondMessage("Can't Delete This Favorite");
        }

        return createRespondMessage("Delete Successfully");
    }
}
