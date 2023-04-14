package com.arshop.springboot.demo.ARShop.dao;

import com.arshop.springboot.demo.ARShop.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface ProductRepository extends JpaRepository<Product,Integer> {

    @Query("Select c from Product c Inner join ProductScore s ON c.productID = s.productID where c.productName like %:productName% ORDER BY s.watchedTime DESC LIMIT 1000 UNION SELECT c FROM Product c where c.productName like %:productName%")
    List<Product> findByProductName(String productName);

    @Query("Select c from Product c ORDER BY c.soldQuanity DESC, c.productReach DESC LIMIT 1000")
    List<Product> findAllWithMostSold();

    @Query("Select c from Product c Inner join ProductScore s ON c.productID = s.productID where s.customerID = :customerID ORDER BY s.watchedTime DESC LIMIT 1000")
    List<Product> findAllWithScore(int customerID);

    @Query("Select c from Product c Inner join ProductScore s ON c.productID = s.productID where s.customerID = :customerID ORDER BY s.watchedTime DESC LIMIT 1000")
    List<Product> findScoreWithImage(int customerID);

    @Query("Select c from Product c where c.productName like %:productName%")
    List<Product> search(String productName);

    Product findByProductID(int productID);

}
