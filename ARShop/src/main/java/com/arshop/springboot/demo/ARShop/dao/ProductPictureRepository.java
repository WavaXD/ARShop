package com.arshop.springboot.demo.ARShop.dao;

import com.arshop.springboot.demo.ARShop.entity.ProductPicture;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductPictureRepository extends JpaRepository<ProductPicture,Integer> {

    List<ProductPicture> findByProductID(int productID);

    @Query("Select c From ProductPicture c")
    List<ProductPicture> findAll();

}
