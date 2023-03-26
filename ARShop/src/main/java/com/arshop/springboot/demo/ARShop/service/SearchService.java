package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.ModelRepository;
import com.arshop.springboot.demo.ARShop.dao.ProductPictureRepository;
import com.arshop.springboot.demo.ARShop.dao.ProductRepository;
import com.arshop.springboot.demo.ARShop.dao.ProductScoreRepository;
import com.arshop.springboot.demo.ARShop.entity.Product;
import com.arshop.springboot.demo.ARShop.entity.ProductScore;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service
public class SearchService {

    private final ProductRepository productRepository;
    private final ProductScoreRepository productScoreRepository;
    private final IdentifyService identifyService;
    private final ProductPictureRepository productPictureRepository;
    private final ModelRepository modelRepository;

    public SearchService(ProductRepository productRepository, ProductScoreRepository productScoreRepository, IdentifyService identifyService, ProductPictureRepository productPictureRepository, ModelRepository modelRepository) {
        this.productRepository = productRepository;
        this.productScoreRepository = productScoreRepository;
        this.identifyService = identifyService;
        this.productPictureRepository = productPictureRepository;
        this.modelRepository = modelRepository;
    }

    public List<Product> contentSearch(Product keyword , HttpServletRequest request){
        var product = productRepository.search(keyword.getProductName());

        if(product.size() != 0){
            for(int i = 0; i < product.size(); i++ ){
                scoreUpdate(identifyService.extractJwt(request), product.get(i).getProductID());
            }
        }

        return product;

    }

    public List productDetail(Product productID , HttpServletRequest request){

        List detail = new LinkedList();

        //get a Product Detail
        var product = productRepository.findById(productID.getProductID());
        detail.add(product);

        if(!product.isEmpty()){
            String picture = getProductPicture(productID.getProductID());
            String model = getModel(productID.getProductID());

            detail.add(picture);
            detail.add(model);

            scoreUpdate(identifyService.extractJwt(request) , productID.getProductID());
            addProductReach(productID.getProductID(),product.get().getProductName() ,product.get().getProductReach());
        }

        return detail;
    }

    public String getModel(int productID){
        var model = modelRepository.findByProductID(productID);

        if(model.size() != 0){
            return model.get(0).getModelName();
        }else{
            return null;
        }
    }

    public String getProductPicture(int productID){
        var picture = productPictureRepository.findByProductID(productID);

        if(picture.size() != 0){
            return picture.get(0).getPictureName();
        }else{
            return null;
        }
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

    public void addProductReach(int productID,String productName ,int reach){
        reach += 1;
        var product = Product.builder()
                .productID(productID)
                .productName(productName)
                .productReach(reach)
                .build();

        productRepository.save(product);
    }

    public List<Product> getPopular(HttpServletRequest request){
        var product = productRepository.findAllWithMostSold();

        return product;
    }

    public List<Product> getRecommend(HttpServletRequest request){

        var recommend = productRepository.findAllWithScore(identifyService.extractJwt(request));

        if(recommend.size() < 10){
            recommend = productRepository.findAllWithMostSold();
        }

        return recommend;
    }
}
