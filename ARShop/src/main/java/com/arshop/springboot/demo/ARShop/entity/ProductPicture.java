package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;

@Entity
@Table(name="productpicture")
public class ProductPicture {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Picture_ID")
    private int pictureID;

    @Column(name="Product_ID")
    private int productID;

    @Column(name="Picture_Name")
    private String pictureName;

    public ProductPicture() {
    }

    public ProductPicture(int productID, String pictureName) {
        this.productID = productID;
        this.pictureName = pictureName;
    }

    public int getPictureID() {
        return pictureID;
    }

    public void setPictureID(int pictureID) {
        this.pictureID = pictureID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getPictureName() {
        return pictureName;
    }

    public void setPictureName(String pictureName) {
        this.pictureName = pictureName;
    }

    @Override
    public String toString() {
        return "ProductPicture{" +
                "pictureID=" + pictureID +
                ", productID=" + productID +
                ", pictureName='" + pictureName + '\'' +
                '}';
    }
}
