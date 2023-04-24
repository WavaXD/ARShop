package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.service.MockService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/mock")
public class MockController {

    private final MockService mockService;

    public MockController(MockService mockService) {
        this.mockService = mockService;
    }

    @GetMapping("/test")
    public void mockTest(HttpServletRequest request){
        mockService.mockCategoryProduct();
    }
}
