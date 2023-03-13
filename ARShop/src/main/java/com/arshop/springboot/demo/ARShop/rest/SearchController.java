package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.entity.Product;
import com.arshop.springboot.demo.ARShop.service.SearchService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1")
public class SearchController {
    @Autowired
    private SearchService searchService;

    @PostMapping("/search")
    public List<Product> contentSearch(@RequestBody Product keyword , HttpServletRequest request){
        return searchService.contentSearch(keyword, request);
    }

    @PostMapping("/product")
    public List getProduct(@RequestBody Product productID , HttpServletRequest request){
        return searchService.productDetail(productID , request);
    }

    @GetMapping("/popular")
    public List<Product> getPopular(HttpServletRequest request){
        return searchService.getPopular(request);
    }

    @GetMapping("/recommend")
    public List<Product> getRecommend(HttpServletRequest request){
        return searchService.getRecommend(request);
    }

}
