package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;

@Entity
@Table(name="productscore")
public class ProductScore {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Product_Score_ID")
    private int productScoreID;

    @Column(name="Customer_ID")
    private int customerID;

    @Column(name="Product_ID")
    private int productID;

    @Column(name="Watched_Time")
    private int watchedTime;

    public ProductScore() {
    }

    public ProductScore(int customerID, int productID, int watchedTime) {
        this.customerID = customerID;
        this.productID = productID;
        this.watchedTime = watchedTime;
    }

    public int getProductScoreID() {
        return productScoreID;
    }

    public void setProductScoreID(int productScoreID) {
        this.productScoreID = productScoreID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getWatchedTime() {
        return watchedTime;
    }

    public void setWatchedTime(int watchedTime) {
        this.watchedTime = watchedTime;
    }

    @Override
    public String toString() {
        return "ProductScore{" +
                "productScoreID=" + productScoreID +
                ", customerID=" + customerID +
                ", productID=" + productID +
                ", watchedTime=" + watchedTime +
                '}';
    }
}
