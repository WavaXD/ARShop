package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="address")
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Address_ID")
    private int addressID;

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

}
