package com.arshop.springboot.demo.ARShop.dao;

import com.arshop.springboot.demo.ARShop.entity.Variation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface VariationRepository extends JpaRepository<Variation,Integer> {

    List<Variation> findByProductID(int productID);

    Variation findByVariationID(int variationID);

    @Query("Select min(c.variationPrice) FROM Variation c Where c.productID = :productID ")
    int findCheapest(int productID);
}
