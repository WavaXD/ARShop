package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;

@Entity
@Table(name="category")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Category_ID")
    private int categoryID;

    @Column(name="Vendor_ID")
    private int vendorID;

    @Column(name="Category_Name")
    private String categoryName;

    @Column(name="Is_Official")
    private Boolean isOfficial;

    public Category() {
    }

    public Category(int vendorID, String categoryName, Boolean isOfficial) {
        this.vendorID = vendorID;
        this.categoryName = categoryName;
        this.isOfficial = isOfficial;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getVendorID() {
        return vendorID;
    }

    public void setVendorID(int vendorID) {
        this.vendorID = vendorID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Boolean getOfficial() {
        return isOfficial;
    }

    public void setOfficial(Boolean official) {
        isOfficial = official;
    }

    @Override
    public String toString() {
        return "Category{" +
                "categoryID=" + categoryID +
                ", vendorID=" + vendorID +
                ", categoryName='" + categoryName + '\'' +
                ", isOfficial=" + isOfficial +
                '}';
    }
}
