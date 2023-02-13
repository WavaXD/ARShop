package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.entity.Customer;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RestController
@RequestMapping("/test")
public class TestController {

    private Customer theCustomer;

    @GetMapping("/hello")
    public String testHello(){
        return "hello";
    }
}
