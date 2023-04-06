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

    @Column(name="Variation_Price")
    private int variationPrice;

    @Column(name="Variation_Quanity")
    private int variationQuanity;

    public Variation() {
    }

    public Variation(int variationID, int productID, String variationName, int variationPrice, int variationQuanity) {
        this.variationID = variationID;
        this.productID = productID;
        this.variationName = variationName;
        this.variationPrice = variationPrice;
        this.variationQuanity = variationQuanity;
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

    public int getVariationPrice() {
        return variationPrice;
    }

    public void setVariationPrice(int variationPrice) {
        this.variationPrice = variationPrice;
    }

    public int getVariationQuanity() {
        return variationQuanity;
    }

    public void setVariationQuanity(int variationQuanity) {
        this.variationQuanity = variationQuanity;
    }

    @Override
    public String toString() {
        return "Variation{" +
                "variationID=" + variationID +
                ", productID=" + productID +
                ", variationName='" + variationName + '\'' +
                ", variationPrice=" + variationPrice +
                ", variationQuanity=" + variationQuanity +
                '}';
    }
}
