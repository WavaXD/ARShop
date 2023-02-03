package com.arshop.springboot.demo.ARShop.dao;

import com.arshop.springboot.demo.ARShop.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category,Integer> {
}
