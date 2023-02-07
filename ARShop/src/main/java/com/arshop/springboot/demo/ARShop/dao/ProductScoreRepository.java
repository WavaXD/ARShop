package com.arshop.springboot.demo.ARShop.dao;

import com.arshop.springboot.demo.ARShop.entity.ProductScore;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductScoreRepository extends JpaRepository<ProductScore,Integer> {
}
