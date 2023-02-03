package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;

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

    public Favorite() {
    }

    public Favorite(int customerID, int productID) {
        this.customerID = customerID;
        this.productID = productID;
    }

    public int getFavoriteID() {
        return favoriteID;
    }

    public void setFavoriteID(int favoriteID) {
        this.favoriteID = favoriteID;
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

    @Override
    public String toString() {
        return "Favorite{" +
                "favoriteID=" + favoriteID +
                ", customerID=" + customerID +
                ", productID=" + productID +
                '}';
    }
}
