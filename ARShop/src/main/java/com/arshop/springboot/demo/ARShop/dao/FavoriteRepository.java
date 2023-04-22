package com.arshop.springboot.demo.ARShop.dao;

import com.arshop.springboot.demo.ARShop.entity.Favorite;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FavoriteRepository extends JpaRepository<Favorite,Integer> {

    List<Favorite> findByCustomerID(int customerID);

    Favorite findByCustomerIDAndProductID(int customerID , int productID);
}
