package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;

@Entity
@Table(name="productcategory")
public class ProductCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Product_Category_ID")
    private int productCategoryID;

    @Column(name="Product_ID")
    private int productID;

    @Column(name="Category_ID")
    private int categoryID;

    public ProductCategory() {
    }

    public ProductCategory(int productID, int categoryID) {
        this.productID = productID;
        this.categoryID = categoryID;
    }

    public int getProductCategoryID() {
        return productCategoryID;
    }

    public void setProductCategoryID(int productCategoryID) {
        this.productCategoryID = productCategoryID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    @Override
    public String toString() {
        return "ProductCategory{" +
                "productCategoryID=" + productCategoryID +
                ", productID=" + productID +
                ", categoryID=" + categoryID +
                '}';
    }
}
