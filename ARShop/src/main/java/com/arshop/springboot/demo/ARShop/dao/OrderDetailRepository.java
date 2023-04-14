package com.arshop.springboot.demo.ARShop.dao;

import com.arshop.springboot.demo.ARShop.entity.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface OrderDetailRepository extends JpaRepository<OrderDetail,Integer> {
    List<OrderDetail> findByProductIDAndVariationIDAndCartID(int productID,int variationID,int cartID);

    @Query("Select c from OrderDetail c where c.cartID = :cartID AND c.orderID = 0")
    List<OrderDetail> findByCartID(int cartID);
}
