package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;

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

    @Column(name="RequestTime")
    private int requestTime;

    @Column(name="Sold")
    private int sold;

    public Product() {
    }

    public Product(String productName, int productPrice, int productQuanity, String productDetail, int vendorID, int requestTime, int sold) {
        this.productName = productName;
        this.productPrice = productPrice;
        this.productQuanity = productQuanity;
        this.productDetail = productDetail;
        this.vendorID = vendorID;
        this.requestTime = requestTime;
        this.sold = sold;
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

    public int getRequestTime() {
        return requestTime;
    }

    public void setRequestTime(int requestTime) {
        this.requestTime = requestTime;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
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
                ", requestTime=" + requestTime +
                ", sold=" + sold +
                '}';
    }
}
