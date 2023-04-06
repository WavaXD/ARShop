package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;

@Entity
@Table(name="model")
public class Model {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Model_ID")
    private int modelID;

    @Column(name="Variation_ID")
    private int variationID;

    @Column(name="Model_Name")
    private String modelName;

    public Model() {
    }

    public Model(int modelID, int variationID, String modelName) {
        this.modelID = modelID;
        this.variationID = variationID;
        this.modelName = modelName;
    }

    public int getModelID() {
        return modelID;
    }

    public void setModelID(int modelID) {
        this.modelID = modelID;
    }

    public int getVariationID() {
        return variationID;
    }

    public void setVariationID(int variationID) {
        this.variationID = variationID;
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
                ", variationID=" + variationID +
                ", modelName='" + modelName + '\'' +
                '}';
    }
}
