package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.auth.AuthenticationController;
import com.arshop.springboot.demo.ARShop.entity.Customer;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/test")
public class TestController {

    private Customer theCustomer;
    private AuthenticationController authenticationController;

    @GetMapping("/hello")
    public String testHello(){
        return "hello";
    }



}
