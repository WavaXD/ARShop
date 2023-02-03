package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;

@Entity
@Table(name="model")
public class Model {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Model_ID")
    private int modelID;

    @Column(name="Product_ID")
    private int productID;

    @Column(name="Model_Name")
    private String modelName;

    public Model() {
    }

    public Model(int productID, String modelName) {
        this.productID = productID;
        this.modelName = modelName;
    }

    public int getModelID() {
        return modelID;
    }

    public void setModelID(int modelID) {
        this.modelID = modelID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    @Override
    public String toString() {
        return "Model{" +
                "modelID=" + modelID +
                ", productID=" + productID +
                ", modelName='" + modelName + '\'' +
                '}';
    }
}
