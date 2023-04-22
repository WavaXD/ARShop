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
@Table(name="productrating")
public class ProductRating {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Rating_ID")
    private int ratingID;

    @Column(name="Customer_ID")
    private int customerID;

    @Column(name="Product_ID")
    private int productID;

    @Column(name="Detail_ID")
    private int detailID;

    @Column(name="Rating_Value")
    private float ratingValue;

    @Column(name="Rating_Comment")
    private String ratingComment;
}
