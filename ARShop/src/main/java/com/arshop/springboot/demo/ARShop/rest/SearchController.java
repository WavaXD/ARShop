package com.arshop.springboot.demo.ARShop.rest;

import com.arshop.springboot.demo.ARShop.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SearchController {
    @Autowired
    private SearchService searchService;
}
