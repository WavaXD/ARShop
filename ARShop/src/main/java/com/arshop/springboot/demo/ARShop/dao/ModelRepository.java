package com.arshop.springboot.demo.ARShop.dao;

import com.arshop.springboot.demo.ARShop.entity.Model;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ModelRepository extends JpaRepository<Model,Integer> {
}
