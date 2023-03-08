package com.arshop.springboot.demo.ARShop.dao;

import com.arshop.springboot.demo.ARShop.entity.ProductScore;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductScoreRepository extends JpaRepository<ProductScore,Integer> {
    List<ProductScore> findByCustomerIDAndProductID(int customerID , int productID);
}
