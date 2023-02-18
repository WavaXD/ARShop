package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.auth.AuthenticationController;
import com.arshop.springboot.demo.ARShop.config.JwtService;
import com.arshop.springboot.demo.ARShop.entity.Customer;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.lang.NonNull;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Date;

@RestController
@RequestMapping("/test")
public class TestController {

    private Customer theCustomer;
    private AuthenticationController authenticationController;

    @GetMapping("/hello")
    public String testHello(){
        return "hello";
    }

    @GetMapping("/extract")
    public String extractJwt(HttpServletRequest request){
        final String authHeader = request.getHeader("Authorization");
        final String jwt;

        jwt = authHeader.substring(7);
        authenticationController.extractEmail(jwt);

        return "extract test";
    }

}
