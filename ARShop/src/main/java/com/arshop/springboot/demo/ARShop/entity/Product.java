package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;
import lombok.Builder;

@Builder
@Entity
@Table(name="product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Product_ID")
    private int productID;

    @Column(name="Product_Name")
    private String productName;

    @Column(name="Product_Price")
    private int productPrice;

    @Column(name="Product_Quanity")
    private int productQuanity;

    @Column(name="Product_Detail")
    private String productDetail;

    @Column(name="Vendor_ID")
    private int vendorID;

    @Column(name="Product_Reach")
    private int productReach;

    @Column(name="Sold_Quanity")
    private int soldQuanity;

    public Product() {
    }

    public Product(int productID, String productName, int productPrice, int productQuanity, String productDetail, int vendorID, int productReach, int soldQuanity) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productQuanity = productQuanity;
        this.productDetail = productDetail;
        this.vendorID = vendorID;
        this.productReach = productReach;
        this.soldQuanity = soldQuanity;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductQuanity() {
        return productQuanity;
    }

    public void setProductQuanity(int productQuanity) {
        this.productQuanity = productQuanity;
    }

    public String getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(String productDetail) {
        this.productDetail = productDetail;
    }

    public int getVendorID() {
        return vendorID;
    }

    public void setVendorID(int vendorID) {
        this.vendorID = vendorID;
    }

    public int getProductReach() {
        return productReach;
    }

    public void setProductReach(int productReach) {
        this.productReach = productReach;
    }

    public int getSoldQuanity() {
        return soldQuanity;
    }

    public void setSoldQuanity(int soldQuanity) {
        this.soldQuanity = soldQuanity;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productID=" + productID +
                ", productName='" + productName + '\'' +
                ", productPrice=" + productPrice +
                ", productQuanity=" + productQuanity +
                ", productDetail='" + productDetail + '\'' +
                ", vendorID=" + vendorID +
                ", productReach=" + productReach +
                ", soldQuanity=" + soldQuanity +
                '}';
    }
}
