package com.arshop.springboot.demo.ARShop.service;

import com.arshop.springboot.demo.ARShop.dao.ProductCategoryRepository;
import com.arshop.springboot.demo.ARShop.dao.ProductRepository;
import com.arshop.springboot.demo.ARShop.entity.Product;
import com.arshop.springboot.demo.ARShop.entity.ProductCategory;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service
public class MockService {

    private final ProductRepository productRepository;
    private final ProductCategoryRepository productCategoryRepository;

    public MockService(ProductRepository productRepository, ProductCategoryRepository productCategoryRepository) {
        this.productRepository = productRepository;
        this.productCategoryRepository = productCategoryRepository;
    }

    public void mockCategoryProduct(){

        List<Integer> mockList = new LinkedList<>();

        mockList.add(1); //sofa
        mockList.add(2); //chair
        mockList.add(3); //table
        mockList.add(4); //cabinet
        mockList.add(5); //bed
        mockList.add(6); //lamp
        mockList.add(7); //tv
        mockList.add(8); //indoor
        int numMax = mockList.size() - 1;
        int num = 0;

        var product = productRepository.findAll();

        for(Product element : product){

            if(num > numMax){
                num = 0;
            }

            var p = ProductCategory.builder()
                    .productID(element.getProductID())
                    .categoryID(mockList.get(num))
                    .build();

            productCategoryRepository.save(p);

            num+=1;
        }
    }
}
