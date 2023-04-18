package com.arshop.springboot.demo.ARShop.structure;

import com.arshop.springboot.demo.ARShop.entity.Model;
import com.arshop.springboot.demo.ARShop.entity.Product;
import com.arshop.springboot.demo.ARShop.entity.ProductPicture;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Optional;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDetailContext {

    private Optional<Product> product;

    private List<ProductPicture> productPicture;

    private List<VariationModelContext> variationModelContext;
}
