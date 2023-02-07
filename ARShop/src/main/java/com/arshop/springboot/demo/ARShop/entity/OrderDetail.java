package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;

@Entity
@Table(name="orderdetail")
public class OrderDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Detail_ID")
    private int detailID;

    @Column(name="Customer_ID")
    private int customerID;

    @Column(name="Product_ID")
    private int productID;

    @Column(name="Variation_ID")
    private int variationID;

    @Column(name="Order_ID")
    private int orderID;

    @Column(name="Vendor_ID")
    private int vendorID;

    @Column(name="Cart_ID")
    private int cartID;

    @Column(name="Quanity")
    private int quanity;

    public OrderDetail() {
    }

    public OrderDetail(int customerID, int productID, int variationID, int orderID, int vendorID, int cartID, int quanity) {
        this.customerID = customerID;
        this.productID = productID;
        this.variationID = variationID;
        this.orderID = orderID;
        this.vendorID = vendorID;
        this.cartID = cartID;
        this.quanity = quanity;
    }

    public int getDetailID() {
        return detailID;
    }

    public void setDetailID(int detailID) {
        this.detailID = detailID;
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

    public int getVariationID() {
        return variationID;
    }

    public void setVariationID(int variationID) {
        this.variationID = variationID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getVendorID() {
        return vendorID;
    }

    public void setVendorID(int vendorID) {
        this.vendorID = vendorID;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public int getQuanity() {
        return quanity;
    }

    public void setQuanity(int quanity) {
        this.quanity = quanity;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "detailID=" + detailID +
                ", customerID=" + customerID +
                ", productID=" + productID +
                ", variationID=" + variationID +
                ", orderID=" + orderID +
                ", vendorID=" + vendorID +
                ", cartID=" + cartID +
                ", quanity=" + quanity +
                '}';
    }
}
