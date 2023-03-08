package com.arshop.springboot.demo.ARShop.dao;

import com.arshop.springboot.demo.ARShop.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface ProductRepository extends JpaRepository<Product,Integer> {

    @Query("Select c from Product c Inner join ProductScore s ON c.productID = s.productID where c.productName like %:productName% ORDER BY s.watchedTime DESC ")
    List<Product> findByProductName(String productName);

    //@Query("Select c from Product c where c.productName like %:productName%")
}
