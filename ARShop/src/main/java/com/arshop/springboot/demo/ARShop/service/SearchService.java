package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.*;
import com.arshop.springboot.demo.ARShop.entity.*;
import com.arshop.springboot.demo.ARShop.structure.ProductContext;
import com.arshop.springboot.demo.ARShop.structure.ProductDetailContext;
import com.arshop.springboot.demo.ARShop.structure.VariationModelContext;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@Service
public class SearchService {

    private final ProductRepository productRepository;
    private final ProductScoreRepository productScoreRepository;
    private final IdentifyService identifyService;
    private final ProductPictureRepository productPictureRepository;
    private final ModelRepository modelRepository;
    private final VariationRepository variationRepository;

    public SearchService(ProductRepository productRepository, ProductScoreRepository productScoreRepository, IdentifyService identifyService, ProductPictureRepository productPictureRepository, ModelRepository modelRepository, VariationRepository variationRepository) {
        this.productRepository = productRepository;
        this.productScoreRepository = productScoreRepository;
        this.identifyService = identifyService;
        this.productPictureRepository = productPictureRepository;
        this.modelRepository = modelRepository;
        this.variationRepository = variationRepository;
    }

    public List<ProductContext> contentSearch(Product keyword , HttpServletRequest request){
        var product = productRepository.search(keyword.getProductName());

        List<ProductContext> productContexts = new LinkedList<>();

        if(product.size() != 0){
            for(Product element : product){
                int variationPrice = variationRepository.findCheapest(element.getProductID());
                var picture = productPictureRepository.findByProductID(element.getProductID());

                var pContext = ProductContext.builder()
                        .product(element)
                        .price(variationPrice)
                        .productPicture(picture.get(0))
                        .build();
                productContexts.add(pContext);
            }

            for(int i = 0; i < product.size(); i++ ){
                scoreUpdate(identifyService.extractJwt(request), product.get(i).getProductID());
            }
        }

        return productContexts;

    }

    public ProductDetailContext productDetail(Product productID , HttpServletRequest request){

        ProductDetailContext productDetailContext = new ProductDetailContext();

        //get a Product Detail
        var product = productRepository.findById(productID.getProductID());

        if(!product.isEmpty()){

            List<VariationModelContext> variationModelContextList = new LinkedList<>();

            var variation = variationRepository.findByProductID(product.get().getProductID());

            for(Variation element : variation){
                var model = modelRepository.findByVariationID(element.getVariationID());

                var variationModel = VariationModelContext.builder()
                        .variation(element)
                        .model(model)
                        .build();

                variationModelContextList.add(variationModel);
            }

            var picture = productPictureRepository.findByProductID(product.get().getProductID());

            productDetailContext = ProductDetailContext.builder()
                    .product(product)
                    .productPicture(picture)
                    .variationModelContext(variationModelContextList)
                    .build();

            scoreUpdate(identifyService.extractJwt(request) , productID.getProductID());
            addProductReach(productID.getProductID(),product.get().getProductName() ,product.get().getProductReach(),product.get().getVendorID());
        }


        return productDetailContext;
    }

    public List getProductVariationAndModel(Product productID){
        var variation = variationRepository.findByProductID(productID.getProductID());
        List variationModel = new LinkedList();

        if(!variation.isEmpty()){
            for(Variation v : variation){
                variationModel.add(v); //add variation then add model of that variation

                int variationID = v.getVariationID();

                var model = modelRepository.findByVariationID(variationID);

                variationModel.add(model);

            }
        }

        return variationModel;
    }

    public void scoreUpdate(int customerID , int productID){

        int scoreNumber;
        int scoreID;

        var score = productScoreRepository.findByCustomerIDAndProductID(customerID,productID);

        //Check if score of each customer and product are existed
        if(score.size() != 0){ // Score existed then update the old one
            scoreNumber = score.get(0).getWatchedTime() + 1;
            scoreID = score.get(0).getProductScoreID();
        }else{// Score not existed create the new one
            scoreNumber = 1;
            scoreID = 0;
        }

        var scoreBuild = ProductScore.builder()
                .productScoreID(scoreID)
                .customerID(customerID)
                .productID(productID)
                .watchedTime(scoreNumber)
                .build();

        productScoreRepository.save(scoreBuild);
    }

    public void addProductReach(int productID,String productName ,int reach, int vendorID){
        reach += 1;
        var product = Product.builder()
                .productID(productID)
                .productName(productName)
                .vendorID(vendorID)
                .productReach(reach)
                .build();

        productRepository.save(product);
    }

    public List<ProductContext> getPopular(HttpServletRequest request){
        var product = productRepository.findAllWithMostSold();

        List<ProductContext> productContexts = new LinkedList<>();

        for(Product element : product){
            int variationPrice = variationRepository.findCheapest(element.getProductID());

            var picture = productPictureRepository.findByProductID(element.getProductID());

            var pContext = ProductContext.builder()
                    .product(element)
                    .price(variationPrice)
                    .productPicture(picture.get(0))
                    .build();
            productContexts.add(pContext);
        }

        return productContexts;
    }

    public List<ProductContext> getRecommend(HttpServletRequest request){

        var recommend = productRepository.findAllWithScore(identifyService.extractJwt(request));

        List<ProductContext> productContexts = new LinkedList<>();

        if(recommend.size() < 10){ //New user less score = less recommend so use most sold instead
            recommend = productRepository.findAllWithMostSold();

            for(Product element : recommend){

                int variationPrice = variationRepository.findCheapest(element.getProductID());
                var picture = productPictureRepository.findByProductID(element.getProductID());

                var pContext = ProductContext.builder()
                        .product(element)
                        .price(variationPrice)
                        .productPicture(picture.get(0))
                        .build();
                productContexts.add(pContext);

            }
            return productContexts;
        }

        for(Product element : recommend){

            int variationPrice = variationRepository.findCheapest(element.getProductID());
            var picture = productPictureRepository.findByProductID(element.getProductID());

            var pContext = ProductContext.builder()
                    .product(element)
                    .price(variationPrice)
                    .productPicture(picture.get(0))
                    .build();
            productContexts.add(pContext);

        }

        return productContexts;
    }

    public List<ProductContext> getByCategory(int categoryID){

        List<ProductContext> productContexts = new LinkedList<>();

        var product = productRepository.findWithCategory(categoryID);

        for(Product element : product){
            int variationPrice = variationRepository.findCheapest(element.getProductID());
            var picture = productPictureRepository.findByProductID(element.getProductID());

            var pContext = ProductContext.builder()
                    .product(element)
                    .price(variationPrice)
                    .productPicture(picture.get(0))
                    .build();
            productContexts.add(pContext);
        }

        return productContexts;
    }

    public List<ProductContext> getByVendor(int vendorID){
        List<ProductContext> productContexts = new LinkedList<>();

        var product = productRepository.findByVendorID(vendorID);

        for(Product element : product){
            int variationPrice = variationRepository.findCheapest(element.getProductID());
            var picture = productPictureRepository.findByProductID(element.getProductID());

            var pContext = ProductContext.builder()
                    .product(element)
                    .price(variationPrice)
                    .productPicture(picture.get(0))
                    .build();
            productContexts.add(pContext);
        }

        return productContexts;
    }

}
