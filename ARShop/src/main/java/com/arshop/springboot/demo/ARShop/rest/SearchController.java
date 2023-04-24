package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.entity.Product;
import com.arshop.springboot.demo.ARShop.entity.Variation;
import com.arshop.springboot.demo.ARShop.service.SearchService;
import com.arshop.springboot.demo.ARShop.structure.ProductContext;
import com.arshop.springboot.demo.ARShop.structure.ProductDetailContext;
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
    public List<ProductContext> contentSearch(@RequestBody Product keyword , HttpServletRequest request){
        return searchService.contentSearch(keyword, request);
    }

    @PostMapping("/product")
    public ProductDetailContext getProduct(@RequestBody Product productID , HttpServletRequest request){
        return searchService.productDetail(productID , request);
    }

    @GetMapping("/popular")
    public List<ProductContext> getPopular(HttpServletRequest request){
        return searchService.getPopular(request);
    }

    @GetMapping("/recommend")
    public List<ProductContext> getRecommend(HttpServletRequest request){
        return searchService.getRecommend(request);
    }

    @GetMapping("/category/{categoryID}")
    public List<ProductContext> getByCategory(@PathVariable int categoryID,HttpServletRequest request){
        return searchService.getByCategory(categoryID);
    }

    @GetMapping("/search/vendor/{vendorID}")
    public List<ProductContext> getByVendor(@PathVariable int vendorID, HttpServletRequest request){
        return searchService.getByVendor(vendorID);
    }

}
