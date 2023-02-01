package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;

@Entity
@Table(name="address")
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Address_ID")
    private int addressId;

    @Column(name="Customer_ID")
    private int customerId;

    @Column(name="Receiver_Name")
    private String receiverName;

    @Column(name="Phone")
    private String phone;

    @Column(name="Province")
    private String province;

    @Column(name="District")
    private String district;

    @Column(name="Subdistrict")
    private String subDistrict;

    @Column(name="Detail")
    private String detail;

    @Column(name="Is_Default")
    private boolean isDefault;

    public Address(){}

    public Address(int addressId, int customerId, String receiverName, String phone, String province, String district, String subDistrict, String detail, boolean isDefault) {
        this.addressId = addressId;
        this.customerId = customerId;
        this.receiverName = receiverName;
        this.phone = phone;
        this.province = province;
        this.district = district;
        this.subDistrict = subDistrict;
        this.detail = detail;
        this.isDefault = isDefault;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getSubDistrict() {
        return subDistrict;
    }

    public void setSubDistrict(String subDistrict) {
        this.subDistrict = subDistrict;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public boolean isDefault() {
        return isDefault;
    }

    public void setDefault(boolean aDefault) {
        isDefault = aDefault;
    }

    @Override
    public String toString() {
        return "Address{" +
                "addressId=" + addressId +
                ", customerId=" + customerId +
                ", receiverName='" + receiverName + '\'' +
                ", phone='" + phone + '\'' +
                ", province='" + province + '\'' +
                ", district='" + district + '\'' +
                ", subDistrict='" + subDistrict + '\'' +
                ", detail='" + detail + '\'' +
                ", isDefault=" + isDefault +
                '}';
    }
}
