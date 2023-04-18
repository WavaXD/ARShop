package com.arshop.springboot.demo.ARShop.structure;

import com.arshop.springboot.demo.ARShop.entity.Product;
import com.arshop.springboot.demo.ARShop.entity.ProductPicture;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductContext {
    private Product product;
    private int price;
    private ProductPicture productPicture;
}
