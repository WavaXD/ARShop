package com.arshop.springboot.demo.ARShop.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.Date;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="Chat")
public class Chat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Chat_ID")
    private int chatID;

    @Column(name="Customer_ID")
    private int customerID;

    @Column(name="Vendor_ID")
    private int vendorID;

    @Column(name="Chat_Detail")
    private String chatDetail;

    @Column(name="Chat_Time")
    private Timestamp chatTime;

    @Column(name="Chat_File")
    private String chatFile;

}
