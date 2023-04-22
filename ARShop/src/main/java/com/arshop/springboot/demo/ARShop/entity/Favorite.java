package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="favorite")
public class Favorite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Favorite_ID")
    private int favoriteID;

    @Column(name="Customer_ID")
    private int customerID;

    @Column(name="Product_ID")
    private int productID;

}
