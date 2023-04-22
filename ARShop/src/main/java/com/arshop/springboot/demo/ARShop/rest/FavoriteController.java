package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.entity.Product;
import com.arshop.springboot.demo.ARShop.service.FavoriteService;
import com.arshop.springboot.demo.ARShop.structure.ProductContext;
import com.arshop.springboot.demo.ARShop.structure.RespondMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/favorite")
public class FavoriteController {

    private final FavoriteService favoriteService;

    public FavoriteController(FavoriteService favoriteService) {
        this.favoriteService = favoriteService;
    }

    @GetMapping("")
    public List<ProductContext> getFavorite(HttpServletRequest request){
        return favoriteService.getFavorite(request);
    }

    @Transactional
    @PostMapping("")
    public RespondMessage addFavorite(@RequestBody Product product, HttpServletRequest request){
        return favoriteService.addFavorite(product, request);
    }

    @Transactional
    @DeleteMapping("{productID}")
    public RespondMessage deleteFavorite(@PathVariable int productID, HttpServletRequest request){
        return favoriteService.deleteFavorite(productID,request);
    }
}
