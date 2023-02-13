package com.arshop.springboot.demo.ARShop.auth;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RegisterRequest {

    private String customerName;
    private String customerEmail;
    private String customerPassword;
    private String customerTel;
    private String customerGender;
    private Date customerBirthdate;
}
