package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;

@Entity
@Table(name="variation")
public class Variation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Variation_ID")
    private int variationID;

    @Column(name="Product_ID")
    private int productID;

    @Column(name="Variation_Name")
    private String variationName;

    public Variation() {
    }

    public Variation(int productID, String variationName) {
        this.productID = productID;
        this.variationName = variationName;
    }

    public int getVariationID() {
        return variationID;
    }

    public void setVariationID(int variationID) {
        this.variationID = variationID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getVariationName() {
        return variationName;
    }

    public void setVariationName(String variationName) {
        this.variationName = variationName;
    }

    @Override
    public String toString() {
        return "Variation{" +
                "variationID=" + variationID +
                ", productID=" + productID +
                ", variationName='" + variationName + '\'' +
                '}';
    }
}
