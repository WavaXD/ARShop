package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "vendor")
public class Vendor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Vendor_ID")
    private int vendorID;

    @Column(name="Vendor_Email")
    private String vendorEmail;

    @Column(name="Vendor_Password")
    private String vendorPassword;

    @Column(name="Vendor_Name")
    private String vendorName;

    @Column(name="Vendor_Tel")
    private String vendorTel;

    public Vendor() {
    }

    public Vendor(String vendorEmail, String vendorPassword, String vendorName, String vendorTel) {
        this.vendorEmail = vendorEmail;
        this.vendorPassword = vendorPassword;
        this.vendorName = vendorName;
        this.vendorTel = vendorTel;
    }

    public int getVendorID() {
        return vendorID;
    }

    public void setVendorID(int vendorID) {
        this.vendorID = vendorID;
    }

    public String getVendorEmail() {
        return vendorEmail;
    }

    public void setVendorEmail(String vendorEmail) {
        this.vendorEmail = vendorEmail;
    }

    public String getVendorPassword() {
        return vendorPassword;
    }

    public void setVendorPassword(String vendorPassword) {
        this.vendorPassword = vendorPassword;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    public String getVendorTel() {
        return vendorTel;
    }

    public void setVendorTel(String vendorTel) {
        this.vendorTel = vendorTel;
    }

    @Override
    public String toString() {
        return "Vendor{" +
                "vendorID=" + vendorID +
                ", vendorEmail='" + vendorEmail + '\'' +
                ", vendorPassword='" + vendorPassword + '\'' +
                ", vendorName='" + vendorName + '\'' +
                ", vendorTel='" + vendorTel + '\'' +
                '}';
    }
}
