package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.auth.AuthenticationController;
import com.arshop.springboot.demo.ARShop.entity.Customer;
import com.arshop.springboot.demo.ARShop.structure.DateUtils;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;


@RestController
@RequestMapping("/test")
public class TestController {

    private DateUtils dateUtils;

    public TestController(DateUtils dateUtils) {
        this.dateUtils = dateUtils;
    }

    @GetMapping("/hello")
    public String testHello(){
        return "hello";
    }

    @GetMapping("/trim")
    public String ttt(){
        String test = "        ";
        String test2 = "    sd    ";

        if(test.trim() == ""){
            System.out.println("test 1 yay");
        }

        if(test2.trim().equals("sd")){
            System.out.println("test 2 yay");
        }

        return test2.trim();
    }

}
