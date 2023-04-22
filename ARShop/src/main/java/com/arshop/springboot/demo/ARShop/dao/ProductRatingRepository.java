package com.arshop.springboot.demo.ARShop.dao;

import com.arshop.springboot.demo.ARShop.entity.ProductPicture;
import com.arshop.springboot.demo.ARShop.entity.ProductRating;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRatingRepository extends JpaRepository<ProductRating,Integer> {

    ProductRating findByDetailID(int detailID);

    List<ProductRating> findByCustomerID(int customerID);
}
