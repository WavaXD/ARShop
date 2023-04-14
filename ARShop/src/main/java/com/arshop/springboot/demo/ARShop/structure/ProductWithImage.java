package com.arshop.springboot.demo.ARShop.structure;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductWithImage {

    private int productID;
    private String productName;
    private String productDetail;
    private int vendorID;
    private int productReach;
    private int soldQuanity;
    private String pictureName;
}
